Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :category


  root "static_pages#home"
  get "static_pages/home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  get "/create", to: "category#new"
  get "/new", to:"category#index"
end
