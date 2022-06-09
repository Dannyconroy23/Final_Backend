Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]

  get 'authorized_user', to: 'users#show'

  


  post 'login', to: 'sessions#login'
  delete 'logout', to: 'sessions#logout'
end
