class Facility < ApplicationRecord

	validates :name, :capacity, :whiteboard, presence: true

	validates :capacity, :whiteboard, numericality: { only_integer: true }

	validates_numericality_of :whiteboard, :capacity, :greater_than_or_equal_to => 0

	has_many :bookings
end
