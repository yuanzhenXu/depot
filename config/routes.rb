Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'login' => :destory

  end


  resources :users
  resources :orders
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products do
    get :who_bought, :on => :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'store#index', :as => 'store'
end
