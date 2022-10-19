class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.references :user, null: false, foreign_key: { to_table: 'users' }
      t.references :property, null: false, foreign_key: { to_table: 'properties' }

      t.timestamps
    end
  end
end
