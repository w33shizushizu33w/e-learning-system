Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]


  root "static_pages#home"
  get "static_pages/home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

end
