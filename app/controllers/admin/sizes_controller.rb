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

    respond_to do |format|
      if @size.save
        format.html { redirect_to (admin_sizes_url), notice: "Size #{@size.code} was successfully created." }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @size = Size.find(params[:id])

    respond_to do |format|
      if @size.update_attributes(params[:size])
        format.html { redirect_to (admin_sizes_url), notice: "Size #{@size.code} was successfully updated." }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @size = Size.find(params[:id])
    @size.destroy

    respond_to do |format|
      format.html { redirect_to (admin_sizes_url), "Size #{@size.code} was successfully deleted." }
    end
  end
end
