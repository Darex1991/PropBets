class PendingBetsController < AuthenticatedController
  expose(:bets){ Bet.where(state: 'Bet in progress')}

end