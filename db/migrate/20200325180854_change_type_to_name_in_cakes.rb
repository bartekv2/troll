class ChangeTypeToNameInCakes < ActiveRecord::Migration[6.0]
  def change
    rename_column :cakes, :type, :name
  end
end
