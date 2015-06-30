class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|

      t.timestamps null: false
    end
  end
end
