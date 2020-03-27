Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "store/homes#index"
  namespace :admin do
    match "login", :to => "administer_sessions#new", :via => :get
    match "login", :to => "administer_sessions#create", :via => :post
    match "logout", :to => "administer_sessions#destroy", :via => :delete
    match "signup", :to => "administers#new", :via => :get
    match "signup", :to => "administers#create", :via => :post
    root :to => "administers#index"
    resources :administer_sessions
    resources :administers
    resources :backstages
    resources :users
    resources :addresses
    resources :categories
    resources :small_categories
    resources :products do
      collection do
        get "get_options"
        post :upimages
      end
      member do
        get "up_down"
      end
    end
    resources :product_images
    resources :comments
    resources :orders do
      collection do
        get "get_address"
      end
    end
    resources :order_products
  end
  namespace :store do
    match "login", :to => "user_sessions#new", :via => :get
    match "login", :to => "user_sessions#create", :via => :post
    match "logout", :to => "user_sessions#destroy", :via => :delete
    match "signup", :to => "users#new", :via => :get
    match "signup", :to => "users#create", :via => :post
    resources :users
    resources :user_sessions
    resources :products
    resources :addresses
    resources :orders do
      collection do
        get "confirm_order"
        post "create_order"
      end
    end
    resources :carts do
      collection do
        get "add_num"
        get "sub_num"
        get "add_cart"
      end
    end
    resources :homes do
      collection do
        get "search"
        get "add_favorite"
        get "del_favorite"
      end
    end
  end
end
