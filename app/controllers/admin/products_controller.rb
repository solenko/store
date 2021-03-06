﻿class Admin::ProductsController < Admin::AdminController

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
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: "Товар #{@product.name} уcпешно cоздан" }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @product = Product.find(params[:id])
 
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to admin_product_path(@product), notice: "Товар #{@product.name} уcпешно изменен" }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to (admin_products_url), notice: "Товар #{@product.name} удален" }
    end
  end

  def build_image
    if params[:file]
      product = Product.find(params[:id])
      new_object = Productimage.new(:image => params[:file])
      builder = ActionView::Helpers::FormBuilder.new(:product, product, self, {}, proc{})
      fields = builder.fields_for(:productimages, new_object, :child_index => "new_productimages") do |builder|
        render(:partial => "productimage_fields", :locals => { :f => builder})
      end
    end
  end


end
