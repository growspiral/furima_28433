Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :purchases, only: :index
end
