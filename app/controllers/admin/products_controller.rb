class Admin::ProductsController < Admin::AdminController

  def index
    scope = Product.order('id')
    @products = scope.page(params[:page]).per(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new

    Size.all.each do |size|
      @product.productsizes.build( :size_id => size.id )
    end
    
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to (admin_products_url), notice: 'Product was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    del = {"_destroy"=>"1"}

    params[:product][:productsizes_attributes].each_value { |value|
      value.merge!(del) if value["amount"].to_i < 1 || value["amount"].blank?
    }

    puts params[:product].inspect
    
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to (admin_products_url), notice: 'Product was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to (admin_products_url), notice: 'Product was successfully deleted.' }
    end
  end
end
