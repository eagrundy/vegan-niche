Rails.application.routes.draw do
  root 'application#homepage'
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'
  

  namespace :admin do
    resources :cuisines,  only: [:new, :create, :index, :show]
    resources :restaurants
  end
  
  resources :users
  resources :reviews
  
  resources :cuisines,  only: [:index, :show] do
    resources :restaurants, only: [:index, :show]
  end
  
  resources :restaurants, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  
  # resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end














# nested route
# new and edit, and index or show
# friday at 6pm et

