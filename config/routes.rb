Rails.application.routes.draw do

  resources :categories

  resources :posts, except: [ :index, :new ] do
    resources :votes, only: [ :create ], module: :posts
    resources :comments, only: [ :create, :destroy ], module: :posts
  end

  resources :users do
    resources :posts, only: [ :index ], module: :users
    resources :comments, only: [ :index, :destroy ]
  end

  resources :comments do
    resources :votes, only: [ :create ], module: :comments
    resources :comments, only: [ :create, :destroy ], module: :comments
  end

  # root 'welcome#index'
  root 'posts#index'

  # sessions logging in and logging out
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
