class AddUserIdToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :user_id, :integer
    add_foreign_key :properties, :users
  end
end
