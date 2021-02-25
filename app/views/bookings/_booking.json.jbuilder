json.extract! booking, :id, :name, :contact_no, :booking_date, :timeslot, :created_at, :updated_at
json.url booking_url(booking, format: :json)
