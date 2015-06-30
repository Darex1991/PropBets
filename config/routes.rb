Rails.application.routes.draw do
  resources :bets

  root 'bets#index'
  get '/mybets' => 'bets#my_bets', :as => :mybets
  get '/betsstoke' => 'bets#bets_stock', :as => :stock
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
