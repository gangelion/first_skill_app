Rails.application.routes.draw do
  devise_for :user

  root to: 'top#index'
  get 'top', to: 'top#mentor_top'

  resources :chats, only: [:index, :create]
  resources :plans, only: [:new, :create]
  resources :users, only: [:index, :show, :edit, :update]
  

  namespace :mentors do
    resources :main, only: [:index]
  end

  # devise_scope :user do
  # get '/users/sign_out' => 'devise/sessions#destroy'
  
  # end

end
