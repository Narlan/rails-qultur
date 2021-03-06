Rails.application.routes.draw do
  get "users/search", to: "users#search", as: "search"

  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show] do
    resources :chat_rooms, only: [ :index, :show, :new, :create, :destroy ] do
      resources :messages, only: [ :create ]
    end
    member do
      post :follow
      post :unfollow
    end
  end

  resources :monuments, only: [:index, :show] do
    resources :questions, only: [:index, :show, :new, :create]
    resources :hunts, only: [:create, :show]
  end

  get "monuments/:monument_id/navigation", to: "monuments#navigation", as: "monument_navigation"

  post "hunts/scanned", to: "hunts#scanned", as: "scanned"
  post "questions/:question_id/choices", to: "choices#create", as: "choice"
  post "questions/:question_id/choices/help", to: "choices#help", as: "help"
  post "users/gift/:user_id", to: "users#update_coins_gift", as: "gift_update"
  mount ActionCable.server => "/cable"
end
