Rails.application.routes.draw do
  
  devise_for :users
  get 'main/index'
  get 'main/show'
  root to: 'top#index'
end
