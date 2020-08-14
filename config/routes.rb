Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :deliveries, only: [:index, :create]
  end
end
