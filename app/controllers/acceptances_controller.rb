class AcceptancesController < AuthenticatedController

  def create
    bet = Bet.find(params[:bet_id])
    bet.update_attributes(state: 'Bet in progress', taker_user_id: current_user.id)
    redirect_to bet, notice: 'You accepted bet'
  end

end