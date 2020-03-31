class AddPuzzleResultToThefts < ActiveRecord::Migration[6.0]
  def change
    add_column :thefts, :puzzle_result, :integer
  end
end
