class CreateAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :attempts do |t|
      t.integer :user_id
      t.integer :timestamp

      t.timestamps
    end
  end
end
