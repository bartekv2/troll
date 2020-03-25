class AddExactTimeOfPreviousToThefts < ActiveRecord::Migration[6.0]
  def change
    add_column :thefts, :exact_time_of_previous, :float
  end
end
