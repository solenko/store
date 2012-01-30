class Admin::AdminController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  
  def index
    redirect_to admin_products_path
  end
end