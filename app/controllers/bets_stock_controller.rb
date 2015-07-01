class BetsStockController < AuthenticatedController
  expose(:bets){ Bet.where(state: 'Waiting for challenger').where.not(creator_user_id: current_user.id)}

end