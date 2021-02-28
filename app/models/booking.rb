class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :facility
	belongs_to :timeslot

	#scope :filter_by_facility, -> (facility_id) { where facility_id: facility_id }
	#scope :filter_by_timeslot, -> (timeslot_id) { where timeslot_id: timeslot_id }
end
