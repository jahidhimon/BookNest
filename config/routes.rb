Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :authors
  resources :publishers

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#home"

  get "user/books/search" => "books#user-search", as: "user_book_search"
end
