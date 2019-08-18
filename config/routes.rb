Rails.application.routes.draw do
  devise_for :users,
  controllers: {
  sessions: 'users/sessions' ,
  registrations: 'users/registrations',
  # omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    collection do
      get :user_logout
      get :user_signup
      get :user_products
    end

    member do
      get :identification
    end
  end

  resources :products do
    resource :product_comments, only: [:create]
    post 'my_product_comments'=> 'product_comments#my_product_comments'
    collection do
      get :confirm
      get :search
      get :get_category_children, defaults: { format: 'json' }
      get :get_category_grandchildren, defaults: { format: 'json' }
      get :get_size, defaults: { format: 'json' }
    end
    member do
      get :purchase
      patch :bought
      get :my_show
      get :unpublished
      get :get_size, defaults: { format: 'json' }
    end
  end

  namespace :api do
    resources "destroy", controller: :products, only: :image_destroy, defaults: { format: 'json' } do
      collection do
        delete "image_destroy"
      end
    end
  end

  resources :creditcards, only: [:index, :new, :show, :destroy, :create]

  resources :categories, only: [:index, :show]
end
