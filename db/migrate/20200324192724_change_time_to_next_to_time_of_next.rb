class ChangeTimeToNextToTimeOfNext < ActiveRecord::Migration[6.0]
  def change
    rename_column :thefts, :time_to_next, :time_of_next
  end
end
