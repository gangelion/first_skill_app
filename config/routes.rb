Rails.application.routes.draw do
  devise_for :user

  root to: 'top#index'
  get 'top', to: 'top#mentor_top'

  resources :plans
  resources :users, except: [:new, :create] do
    member do 
      get "delete_confirm"
    end
  end
  resources :chats, only: [:index, :create]
  

  namespace :mentors do
    resources :main, only: [:index]
  end
end
