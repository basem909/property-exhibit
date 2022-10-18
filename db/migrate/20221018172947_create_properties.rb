class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :adress, null: false

      t.timestamps
    end
  end
end
