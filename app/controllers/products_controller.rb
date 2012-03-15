class ProductsController < ApplicationController
  layout "catalog"
  before_filter :find_objects, :set_category_title
  attr_reader :category, :seasson

def newest
  @products = Product.where(:new_product => true).page(params[:page]).per(12)
  render "index"
end

def show
  @product = Product.find(params[:id])
  @title = @product.name
end

def index
  scope = Product.order('created_at desc')
#  scope = scope.categories.where(:category_id => @category.id) if @category

  scope = scope.joins(:productcategories).where('productcategories.category_id = ?', @category.id) if @category
  @products = scope.page(params[:page]).per(12)

end

private
  def find_objects
    @category = Category.find(params[:category_id]) if params[:category_id].present?
  end

  def set_category_title
    if @category.nil?
      @title = "Новинки"
    elsif @category.root?
      @title = "#{category.name}"
    else
      @title = "#{category.root.name} - #{category.name}"
    end
  end
end
