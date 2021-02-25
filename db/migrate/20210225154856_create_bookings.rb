class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :contact_no
      t.date :booking_date
      t.time :timeslot

      t.timestamps
    end
  end
end
