class BetsController < AuthenticatedController
  expose(:bet, attributes: :bet_params)
  expose(:bets)

  def create
    if bet.save
      redirect_to bet, notice: 'Bet was successfully created.'
    else
      render :new
    end
  end

  def update
    if bet.save
      redirect_to bet, notice: 'Bet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    bet.destroy
    redirect_to bets_url, notice: 'Bet was successfully destroyed.'
  end

  private
  def bet_params
    params.require(:bet).permit(:name, :description, :start_on, :finish_on, :state, :creator_user_id, :winner_code, prize_attributes: [:description, :bet_id])
  end
end
