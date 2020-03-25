class AddExactTimeToThefts < ActiveRecord::Migration[6.0]
  def change
    add_column :thefts, :exact_time, :float
  end
end
