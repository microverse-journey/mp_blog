Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }

  namespace :Api do
    namespace :V1 do
      resource :users
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  resources :posts, only: [:new, :create]

  # Defines the root path route ("/")
  root "users#index"
end
