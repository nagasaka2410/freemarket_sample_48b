Rails.application.routes.draw do
  devise_for :users,
  controllers: {
  sessions: 'users/sessions' ,
  registrations: 'users/registrations',
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    collection do
      get :identification
      get :user_logout
      get :user_signup
    end
  end

  resources :products do
    collection do
      get :confirm
    end
  end

  resources :categories, only: :index
end
