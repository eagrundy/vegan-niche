Rails.application.routes.draw do
  
  resources :users, only: [:new, :create, :show]
  resources :reviews
  resources :restaurants

  root 'application#homepage'
  # get '/signup', to: 'users#new'
  # post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
