class RemoveContactNoFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :contact_no, :string
  end
end
