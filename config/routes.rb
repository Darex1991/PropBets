Rails.application.routes.draw do
  resources :bets

  root 'bets#index'
  get '/mybets' => 'bets#my_bets', :as => :mybets
  get '/betsstock' => 'bets#bets_stock', :as => :stock
  get '/pendingbets' => 'bets#pending_bets', :as => :pending
  get '/betshistory' => 'bets#bets_history', :as => :history
  match '/betsstock/:id' => 'bets#accept_bets', via: [:put], :as => :accept

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
