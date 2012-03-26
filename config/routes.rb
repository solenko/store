Store::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "admin/sessions" }

  get "main" => "static_pages#main"
  get "contacts" => "static_pages#contacts"
  get "admin" => "admin/admin#index"
  match 'plupload_rails/_plupload_uploader', :controller=>'plupload_rails', :action=>'_plupload_uploader', :as=>'pluploader'
  
  match 'newest', :to => 'products#newest', :defaults => {:mode => 'newest'}, :as => 'newest_products'
  match 'newest/:id', :to => 'products#show', :defaults => {:mode => 'newest'}, :as => 'newest_product'
  match 'products(/:category_id)', :to => 'products#index', :defaults => {:mode => 'all' }, :as => 'products'
  match 'product(/:category_id)/:id', :to => 'products#show', :defaults => {:mode => 'all' }, :as => 'product'

  namespace :admin do
    resources :users
    resources :products
    resources :categories
    resources :sizes
    resources :static_pages
  end
 
  root :to => 'static_pages#main'

end
