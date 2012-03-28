Store::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "admin/sessions" }

  #static begin
  get "main" => "static_pages#main"
  get "stock" => "static_pages#stock"
  get "about" => "static_pages#about"
  get "terms" => "static_pages#terms"
  get "sizes" => "static_pages#sizes"
  get "contacts" => "static_pages#contacts"
  #static end
  
  match '/admin/products/build_image/:id', :controller=>'admin/products', :action=>'build_image'

  #catalog begin
  match 'newest', :to => 'products#newest', :defaults => {:mode => 'newest'}, :as => 'newest_products'
  match 'newest/:id', :to => 'products#show', :defaults => {:mode => 'newest'}, :as => 'newest_product'
  match 'products(/:category_id)', :to => 'products#index', :defaults => {:mode => 'all' }, :as => 'products'
  match 'product(/:category_id)/:id', :to => 'products#show', :defaults => {:mode => 'all' }, :as => 'product'
  #catalog end

  # admin begin
  get "admin" => "admin/admin#index"
  namespace :admin do
    resources :users
    resources :products
    resources :categories
    resources :sizes
    resources :static_pages
  end
  #admin end

  root :to => 'static_pages#main'

end
