Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show]
  resources :monuments, only: [:index, :show] do
    resources :questions, only: [:index, :new, :create]
  end
  resources :hunts, only: [:create]


post "/hunts/scanned", to: "hunts#scanned", as: "scanned"

end
