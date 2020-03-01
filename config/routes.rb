Rails.application.routes.draw do
  devise_for :user

  root to: 'top#index'
  get 'top', to: 'top#mentor_top'

  resources :chats, only: [:index, :create]
  resources :plans
  resources :users, only: [:index, :show, :edit, :update]
  

  namespace :mentors do
    resources :main, only: [:index]
  end
end
