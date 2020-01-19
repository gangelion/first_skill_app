Rails.application.routes.draw do
  devise_for :mentors, controllers: {
  sessions:      'mentors/sessions',
  passwords:     'mentors/passwords',
  registrations: 'mentors/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  resources :main, only: [:index, :show]
  resources :chats, only: [:index, :create]
  
  namespace :mentors do
    resources :main, only: :index
  end

  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'top#index'
end
