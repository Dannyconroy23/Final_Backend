Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :destroy]
  get 'characters', to: 'characters#index'
  get 'authorized_user', to: 'users#show'
  post 'login', to: 'sessions#login'
  delete 'logout', to: 'sessions#logout'
end
