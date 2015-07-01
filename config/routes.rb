Rails.application.routes.draw do
  resources :bets do
    resources :acceptances, only: [:create]
  end

  resource :my_bets, only: [:show]
  resource :bets_stock, only: [:show], controller: 'bets_stock'
  resource :pending_bets, only: [:show]
  resource :bets_history, only: [:show], controller: 'bets_history'

  root 'bets#index'

  #match '/betsstock/:id' => 'bets#accept_bets', via: [:put], :as => :accept

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
