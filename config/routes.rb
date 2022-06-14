Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :destroy]
  resources :favorites, only: [:index, :show, :create]
  resources :characters, only: [:index, :show]
  get 'characters', to: 'characters#index'
  get 'characters/_id', to: 'characters#show'

  post 'favorites', to: 'favorites#create'

  
  get '/favorites/by_user/:id', to: 'favorites#user_favorites'

  get 'authorized_user', to: 'users#show'
 
  post 'login', to: 'sessions#login'
  delete 'logout', to: 'sessions#logout'
end
