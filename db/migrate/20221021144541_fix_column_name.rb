class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :adress, :address
  end
end
