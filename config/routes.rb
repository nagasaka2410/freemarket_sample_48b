Rails.application.routes.draw do
  devise_for :users,
  controllers: {
  sessions: 'users/sessions' ,
  registrations: 'users/registrations',
  # omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    collection do
      get :identification
    end
  end

  resources :products do
    collection do
      get :confirm
    end
  end

  resources :categories, only: :index
end
