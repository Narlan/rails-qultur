Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :monuments, only: [:index] # :show
end
