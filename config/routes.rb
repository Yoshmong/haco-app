Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :users, only: [:index, :edit, :update]
end
