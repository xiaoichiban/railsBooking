class Timeslot < ApplicationRecord

	validates :time, presence: true

	has_many :bookings
end
