Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
 namespace :admin do
   resources :products
 end

  namespace :account do
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart

    end
  end
  resources :cart_items
  resources :orders
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end
end
