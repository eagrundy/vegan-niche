Rails.application.routes.draw do
  root 'application#homepage'
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  delete '/logout' => 'sessions#destroy'

  namespace :admin do
    resources :cuisines,  only: [:new, :create, :index, :show]
    resources :restaurants, only: [:new, :create, :index]
  end
  
  resources :users
  resources :restaurants
  resources :cuisines
  # resources :reviews
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
