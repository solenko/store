class ProductsController < ApplicationController
  layout "catalog"
  before_filter :find_objects
  attr_reader :category, :seasson

def new
  @products = Product.where(:new_product => true)
  render "index"
end

def show
  @product = Product.find(params[:id])
end

def index
  scope = Product.scoped
  scope = scope.where(:category_id => @category.id) if @category
  scope = scope.where(:seasson_id => @seasson.id) if @seasson
  @products = scope #.paginate :page => params[:page]
end

private
  def find_objects
    @category = Category.find(params[:category_id]) if params[:category_id].present?
    @seasson = Seasson.find(params[:seasson_id]) if params[:seasson_id].present?
  end
end
