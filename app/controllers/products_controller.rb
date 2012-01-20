class ProductsController < ApplicationController
  layout "catalog"
  before_filter :find_objects
  attr_reader :category, :seasson

def newest
  @products = Product.where(:new_product => true).page(params[:page]).per(3)
  render "index"
end

def show
  @product = Product.find(params[:id])
end

def index
#  scope = Product.order('created_at desc')
#  scope = scope.categories.where(:category_id => @category.id) if @category

  scope = Product.joins(:productcategories).where('productcategories.category_id = ?', @category.id) if @category
  @products = scope.page(params[:page]).per(4)
end

private
  def find_objects
    @category = Category.find(params[:category_id]) if params[:category_id].present?
  end
end
