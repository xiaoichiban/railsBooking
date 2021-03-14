# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	# admin id = 1. Admin can manage Timeslot and Facilities
	# id 2-6 normal users
	users = User.create([
		{name: 'admin', email: 'admin@gmail.com', password: 'password', password_confirmation: 'password', contact_number: '91019234'},
		{name: 'tom', email: 'tom@gmail.com', password: 'password', password_confirmation: 'password', contact_number: '92338871'},
		{name: 'sam', email: 'sam@gmail.com', password: 'password', password_confirmation: 'password', contact_number: '92008871'},
		{name: 'lily', email: 'lily@gmail.com', password: 'password', password_confirmation: 'password', contact_number: '91019143'},
		{name: 'lisa', email: 'lisa@gmail.com', password: 'password', password_confirmation: 'password', contact_number: '97335471'},
		{name: 'alexis', email: 'alexis@gmail.com', password: 'password', password_confirmation: 'password', contact_number: '97115523'},
	])

	# default office working hours
	timeslots = Timeslot.create([
		{time: '0900 - 1000'}, {time: '1000 - 1100'}, {time: '1100 - 1200'}, {time: '1200 - 1300'},
		{time: '1300 - 1400'}, {time: '1400 - 1500'}, {time: '1500 - 1600'}, {time: '1600 - 1700'},{time: '1700 - 1800'}
	])

	# default 6 facilities
	facilities = Facility.create([
		{name: 'Galaxy Space 1', capacity: '16', whiteboard: '2', conferencing: true},
		{name: 'Galaxy Space 2', capacity: '8', whiteboard: '1',conferencing: true},
		{name: 'Earth Room', capacity: '10', whiteboard: '1', conferencing: true},
		{name: 'Azure Mini', capacity: '4', whiteboard: '1', conferencing: true},
		{name: 'Azure Conferencing', capacity: '10', whiteboard: '1', conferencing: true},
		{name: 'Xenon Mini', capacity: '4', whiteboard: '1', :conferencing => false}
	])

	#Galaxy Room 1 (id 1) is left with 5pm slot
	bookings = Booking.create([
		{booking_date: '19-03-2021', user_id: 3, facility_id: 1, timeslot_id: 1},
		{booking_date: '19-03-2021', user_id: 3, facility_id: 1, timeslot_id: 2},
		{booking_date: '19-03-2021', user_id: 3, facility_id: 1, timeslot_id: 3},
		{booking_date: '19-03-2021', user_id: 4, facility_id: 1, timeslot_id: 4},
		{booking_date: '19-03-2021', user_id: 4, facility_id: 1, timeslot_id: 5},
		{booking_date: '19-03-2021', user_id: 5, facility_id: 1, timeslot_id: 6},
		{booking_date: '19-03-2021', user_id: 5, facility_id: 1, timeslot_id: 7},
		{booking_date: '19-03-2021', user_id: 2, facility_id: 1, timeslot_id: 8},

		{booking_date: '18-03-2021', user_id: 5, facility_id: 1, timeslot_id: 1},
		{booking_date: '18-03-2021', user_id: 5, facility_id: 1, timeslot_id: 2},
		{booking_date: '18-03-2021', user_id: 4, facility_id: 1, timeslot_id: 3},
		{booking_date: '18-03-2021', user_id: 6, facility_id: 1, timeslot_id: 4},
		{booking_date: '18-03-2021', user_id: 6, facility_id: 1, timeslot_id: 5},

		{booking_date: '18-03-2021', user_id: 6, facility_id: 2, timeslot_id: 2},
		{booking_date: '18-03-2021', user_id: 6, facility_id: 3, timeslot_id: 4},
		{booking_date: '18-03-2021', user_id: 4, facility_id: 4, timeslot_id: 5},
	])
