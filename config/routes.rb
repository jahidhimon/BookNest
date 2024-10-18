Rails.application.routes.draw do
  devise_for :librarians
  resources :lendings
  devise_for :users
  resources :books
  resources :authors
  resources :publishers

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "/profile" => "pages#user_profile", as: "user_profile"

  get "/dashboard" => "staff#dashboard", as: "dashboard"
  get "/browse_books" => "staff#browse_books", as: "browse_books"
  get "/users" => "staff#users", as: "users"
  get "/user/:id" => "staff#user", as: "user"
  post "/lendings/:id/return" => "lendings#return", as: "return"

  # Defines the root path route ("/")
  root "pages#home"
end
