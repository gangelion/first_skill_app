Rails.application.routes.draw do
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  resources :main, only: [:index, :show]
  resources :chats, only: [:index, :create]
  resources :mentor_select, only: [:index, :show]
  
  namespace :mentors do
    resources :main, only: [:index]
  end

  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'top#index'
  get 'top', to: 'top#mentor_top'
end
