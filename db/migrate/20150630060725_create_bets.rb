class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :creator_user_id
      t.integer :taker_user_id
      t.integer :prize_id
      t.string :name
      t.text :description
      t.date :start_on
      t.date :finish_on

      t.timestamps null: false
    end
  end
end
