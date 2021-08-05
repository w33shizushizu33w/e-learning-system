Rails.application.routes.draw do
  get "/" => "static_pages#home"
  get "/about" => "static_pages#about"
  get "/contact" => "static_pages#contact"
  get "/signup" => "users#new"
end
