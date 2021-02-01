Rails.application.routes.draw do
  root 'application#homepage'
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  
  
  delete '/logout' => 'sessions#destroy'

  namespace :admin do
    resources :cuisines,  only: [:new, :create, :index, :show, :edit]
    resources :restaurants, only: [:show, :new, :create, :edit, :update, :destroy, :index]
  end
  
  resources :users
  resources :restaurants, only: [:index, :show]
  resources :reviews, only: [:create, :destroy]
  
  resources :cuisines,  only: [:new, :create, :index, :show] do
    resources :restaurants, only: [:new, :create, :index, :show]
  end

  # resources :restaurants do
  #   resources :reviews, only: [:create, :edit, :update]
  # end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
