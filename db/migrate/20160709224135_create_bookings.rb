class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|

      t.references :user
      t.references :activity

      t.timestamps
    end
  end
end
