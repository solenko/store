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
      @product.productsizes.build( :size_id => size.id, :amount => 0 )
    end
    
  end

  def edit
    @product = Product.find(params[:id])

    Size.all.each do |size|
      @product.productsizes.build( :size_id => size.id, :amount => 0 ) unless @product.productsizes.collect { |a| a.size_id }.include? size.id
    end
  end

  def create

#    params["product"]["productsizes_attributes"].delete_if {|k,v|
#       v["amount"].blank? || v["amount"].to_i < 1
#      }

#    sizes_params = params[:product].delete(:productsizes_attributes)
    @product = Product.new(params[:product])
    
#    @product.update_attributes(:productsizes_attributes => sizes_params )
#    @product.update_attributes(params[:product][:productsizes]) if @product.save #hack

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully created.' }
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
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully updated.' }
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
