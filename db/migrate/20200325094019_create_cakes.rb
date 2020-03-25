class CreateCakes < ActiveRecord::Migration[6.0]
  def change
    create_table :cakes do |t|
      t.string :type
      t.integer :cal_min
      t.integer :cal_max

      t.timestamps
    end
  end
end
