class Admin::StaticPagesController < Admin::AdminController

  def index
    @static_pages = StaticPage.all
  end

  def new
    @static_page = StaticPage.new
  end

  def edit
    @static_page = StaticPage.find(params[:id])
  end

  def create
    @static_page = StaticPage.new(params[:static_page])

    respond_to do |format|
      if @static_page.save
        format.html { redirect_to (admin_static_pages_url), notice: "Страница #{@static_page.name} уcпешно cоздана" }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @static_page = StaticPage.find(params[:id])
   
    respond_to do |format|
      if @static_page.update_attributes(params[:static_page])
        format.html { redirect_to (admin_static_pages_url), notice: "Страница #{@static_page.name} уcпешно изменена" }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @static_page = StaticPage.find(params[:id])
    @static_page.destroy

    respond_to do |format|
      format.html { redirect_to (admin_static_pages_url), notice: "Страница #{@static_page.name} удалена" }
    end
  end
end
