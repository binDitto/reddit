Rails.application.routes.draw do


  get 'sessions/login'

  get 'sessions/create'

  get 'sessions/logout'

  resources :posts do
    resources :votes, only: [ :create ], module: :votes
  end

  resources :users do
    resources :posts, only: [ :index ], module: :users
  end

  root 'welcome#index'

  # sessions logging in and logging out
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
