class AddFacilityIdToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :facility_id, :integer
    add_index :bookings, :facility_id
  end
end
