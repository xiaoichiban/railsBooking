class AddTimeslotIdToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :timeslot_id, :integer
    add_index :bookings, :timeslot_id
  end
end
