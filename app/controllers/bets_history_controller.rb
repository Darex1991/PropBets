class BetsHistoryController < AuthenticatedController
  expose(:bets){ Bet.where(state: 'Finished')}

end