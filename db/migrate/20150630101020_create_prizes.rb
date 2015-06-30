class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.integer :bet_id
      t.text :description

      t.timestamps null: false
    end
  end
end
