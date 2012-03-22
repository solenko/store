class ProductsController < ApplicationController
  layout "catalog"
  before_filter :find_objects, :set_category_title
  attr_reader :category, :seasson

def newest
  scope = Product.where(:new_product => true).order("CASE WHEN productsizes_count = 0 THEN 1 ELSE 0 END, new_product DESC, id DESC")
  @products = scope.page(params[:page]).per(12)
  render "index"
end

def show
  @product = Product.find(params[:id])
  @title = "#{@title} - #{@product.name}"
  
  if params[:mode] == 'newest'
    products = Product.where(:new_product => true).order("CASE WHEN productsizes_count = 0 THEN 1 ELSE 0 END, new_product DESC, id DESC").collect {|i| i.id}
  elsif params[:mode] == 'all' && @category.present?
    products = Product.joins(:productcategories).where('productcategories.category_id = ?', @category.id).order("CASE WHEN productsizes_count = 0 THEN 1 ELSE 0 END, new_product DESC, id DESC").collect {|i| i.id}
  else
    products = Product.order("CASE WHEN productsizes_count = 0 THEN 1 ELSE 0 END, new_product DESC, id DESC").collect {|i| i.id}
  end
  
  @product_index = products.index(@product.id)
  @count = (products.size - 1)
  
  if @count > 1 #view prev/next link only if have more than one product
    if @product_index == @count #cycle pagination
      @next_product = products[0]
	else
	  @next_product = products[@product_index+1]
    end
	  @prev_product = products[@product_index-1]
  end  
  
  
end

def index
  
  if @category
    scope = Product.joins(:productcategories).where('productcategories.category_id = ?', @category.id).order("CASE WHEN productsizes_count = 0 THEN 1 ELSE 0 END, new_product DESC, id DESC")
  else
    scope = Product.order("CASE WHEN productsizes_count = 0 THEN 1 ELSE 0 END, new_product DESC, id DESC")
  end
  
  @products = scope.page(params[:page]).per(12)
end

private
  def find_objects
    @category = Category.find(params[:category_id]) if params[:category_id].present?
  end

  def set_category_title
    if params[:mode] == 'newest'
      @title = "Новинки"
	elsif @category && @category.root?
      @title = "#{category.name}"
    elsif @category
      @title = "#{category.root.name} - #{category.name}"
	else
	  @title = "Все товары"
    end
  end
end
