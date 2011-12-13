class ProductsController < ApplicationController
  before_filter :find_objects
  attr_reader :category, :seasson

def index
  scope = Items.all
  scope = scope.by_category if @category
  scope = scope.by_season if @seasson
  @items = scope.paginate :page => params[:page]
end

private
  def find_objects
    @category = Category.find(params[:category_id]) if params[:category_id].present
    @seasson = Seasson.find(params[:seasson_id]) if params[:seasson_id].present
  end
end
