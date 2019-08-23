Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show] do
    resources :chat_rooms, only: [ :index, :show, :new, :create, :destroy ] do
      resources :messages, only: [ :create ]
    end
  end

  resources :monuments, only: [:index, :show] do
    resources :questions, only: [:index, :show, :new, :create]
    resources :hunts, only: [:create, :show]
  end

  post "hunts/scanned", to: "hunts#scanned", as: "scanned"

end
