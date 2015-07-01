class MyBetsController < AuthenticatedController
  expose(:my_created_bets) { Bet.where(creator_user_id: current_user.id) }
  expose(:my_taken_bets) { Bet.where(taker_user_id: current_user.id) }


end