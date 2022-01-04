Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  devise_for :users
  root to: "spots#index"
  resources :spots
  resources :events
  resources :areas
  resources :users, only: :show
end
