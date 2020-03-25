class AddNextCakeCalToThefts < ActiveRecord::Migration[6.0]
  def change
    add_column :thefts, :next_cake_cal, :integer
  end
end
