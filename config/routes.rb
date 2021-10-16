Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :users, only: [:edit, :update]
end
