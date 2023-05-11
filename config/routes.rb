Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/users", to: "users#index", as: "users"
  get "/users/:id", to: "users#show", as: 'user'
  # Defines the root path route ("/")
  root "users#index"
end
