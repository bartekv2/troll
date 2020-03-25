class AddNextCakeIdToThefts < ActiveRecord::Migration[6.0]
  def change
    add_column :thefts, :next_cake_id, :integer
  end
end
