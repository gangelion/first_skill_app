Rails.application.routes.draw do
  devise_for :users
  resources :main, only: [:index, :show]
  resources :chats, only: [:index, :create]

  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'top#index'
end
