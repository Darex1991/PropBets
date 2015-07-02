class BetsHistoryController < AuthenticatedController
  expose(:bets){ Bet.finished}

#SCOPE TO DO
end