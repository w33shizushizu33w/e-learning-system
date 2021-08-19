Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories
  resources :lessons

  resources :categories do
    member do
      resources :words
    end
  end

  root "static_pages#home"
  get "static_pages/home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  delete "/categories", to: "categories#destroy"
  delete "/categories/:id/words", to: "words#destroy"
end
