Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :scans, only: [:index]
  resources :monuments, only: [:index, :show] do
    resources :questions, only: [:index, :new, :create]
  end
end
