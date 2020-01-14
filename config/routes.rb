Rails.application.routes.draw do
  devise_for :users
  get 'main/index'
  get 'main/show'
  get 'chats/index'
  post 'chats', to: 'chats#create'

  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'top#index'
end
