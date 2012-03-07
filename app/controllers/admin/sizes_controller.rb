class Admin::SizesController < Admin::AdminController

  def index
    @sizes = Size.all
  end

  def new
    @size = Size.new
  end

  def edit
    @size = Size.find(params[:id])
  end

  def create
    @size = Size.new(params[:size])

    if @size.save
      redirect_to (admin_sizes_url), notice: "Размер #{@size.code} успешно создан."
    else
      render action: "new"
    end

  end

  def update
    @size = Size.find(params[:id])

    if @size.update_attributes(params[:size])
      redirect_to (admin_sizes_url), notice: "Размер #{@size.code} успешно изменён."
    else
      render action: "edit"
    end

  end

  def destroy
    @size = Size.find(params[:id])
    @size.destroy

    redirect_to (admin_sizes_url), notice: "Размер #{@size.code} удален."
  end

end
