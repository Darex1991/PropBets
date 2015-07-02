class BetsController < AuthenticatedController
  expose(:bet, attributes: :bet_params)
  expose(:bets)

  # POST /bets
  # POST /bets.json
  def create
      if bet.save
         redirect_to bet, notice: 'Bet was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
      if bet.save
       redirect_to bet, notice: 'Bet was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    bet.destroy
       redirect_to bets_url, notice: 'Bet was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:name, :description, :start_on, :finish_on, :state, :creator_user_id, :winner_code, prize_attributes: [:description, :bet_id])
    end
end
