class CreateThefts < ActiveRecord::Migration[6.0]
  def change
    create_table :thefts do |t|
      t.integer :cake_id
      t.integer :cake_cal
      t.integer :user_id
      t.integer :time_to_next

      t.timestamps
    end
  end
end
