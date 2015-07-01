class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy, :accept_bets]
  before_action :authenticate_user!, except: [:index]

  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.all
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
  end

  # GET /bets/my
  def my_bets
    @my_bets_created = Bet.where(:creator_user_id => current_user.id)
    @my_bets_taken = Bet.where(:taker_user_id => current_user.id)
  end

  # GET /betsstock
  def bets_stock
    @bets_stock = Bet.where(:state => 'Waiting for challenger').where.not(:creator_user_id => current_user.id)
  end

  # PUT /betsstock/1
  def accept_bets
    @bet.update_attribute(:state, 'Bet in progress')
    @bet.update_attribute(:taker_user_id, current_user.id)
    redirect_to @bet, notice: 'You accepted bet'
  end

  # GET /bets/pending
  def pending_bets
    @pending_bets = Bet.where(:state => 'Bet in progress')
  endormat.html { redirect_to @bet, notice: 'Bet was successfully created.' }

  #Get /bets/history
  def bets_history
    @bets_history = Bet.where(:state => 'Finished')
  end
  # GET /bets/new
  def new
    @bet = Bet.new
    @bet.prize = Prize.new
  end

  # GET /bets/1/edit
  def edit
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)
    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location: @bet }
      else
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { render :edit }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:name, :description, :start_on, :finish_on, :state, :creator_user_id, prize_attributes: [:description, :bet_id])
    end
end
