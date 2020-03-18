Rails.application.routes.draw do
  devise_for :user

  root to: 'top#index'
  get 'top', to: 'top#mentor_top'

  resources :plans do
    collection do
      get "all_mentor"
      get "new_arrival_mentor"
      get "search"
    end
  end

  resources :users, except: [:new, :create] do
    resources :messages, only: [:index, :create, :show]
    member do 
      get "delete_confirm"
    end
  end
  resources :skills, only:[:index]
  resources :chats, only: [:index, :create]
  
  resources :relationships, only: [:create, :destroy]

  resources :articles, only: [:index, :new, :create]

  namespace :mentors do
    resources :main, only: [:index]
  end
end
