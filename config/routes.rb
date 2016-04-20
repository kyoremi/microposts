Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #get 'followings', to: 'users#followings'
  #get 'followers', to: 'users#followers'
  
  
  
  resources :users do
    member do
      #get 'followings', to: 'users#followings'
      #get 'followers', to: 'users#followers' 
      get :followings, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  end