class Admin::CategoriesController < Admin::AdminController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @category.children.build
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to (admin_categories_url), notice: "Категори�? #{@category.name} у�?пешно �?оздана" }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to (admin_categories_url), notice: "Категори�? #{@category.name} у�?пешно обновлена" }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to (admin_categories_url), notice: "Категори�? #{@category.name} удалена" }
     end
  end
end
