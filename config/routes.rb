Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  devise_for :users
  root to: "spots#index"
  resources :users, only: [:index, :edit, :update]
  resources :spots, only: [:index, :new]
end
