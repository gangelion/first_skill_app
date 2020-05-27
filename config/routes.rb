Rails.application.routes.draw do
  devise_for :user

  # get '*unmatched_route', to: 'application#render_404'

  root to: 'top#index'
  get 'top', to: 'top#mentor_top'

  resources :plans do
    collection do
      get "all_mentor"
      get "new_arrival_mentor"
      get "search"
    end
  end

  resources :users, except: %i[new create] do
    resources :messages, only: %i[index create show]
    member do
      get "delete_confirm"
    end
  end
  resources :skills, only: [:index]

  resources :relationships, only: %i[create destroy]

  resources :articles
end
