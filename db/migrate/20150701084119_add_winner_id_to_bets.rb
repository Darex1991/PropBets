class AddWinnerIdToBets < ActiveRecord::Migration
  def change
    add_column :bets, :winner_id, :int
  end
end
