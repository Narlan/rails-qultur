Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show]
  resources :scans, only: [:index]
  resources :monuments, only: [:index, :show] do
    resources :questions, only: [:index, :show, :new, :create]
  end

post "/hunts/scanned", to: "hunts#scanned", as: "scanned"

end
