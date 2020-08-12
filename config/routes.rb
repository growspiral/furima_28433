Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:show, :new, :create]
  resources :purchases, only: :index
end
