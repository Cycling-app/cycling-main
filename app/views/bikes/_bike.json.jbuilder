json.extract! bike,
  :id,
  :serial_number,
  :make,
  :brand,
  :client_id,
  :bought_on,
  :created_at,
  :updated_at
  
json.url bike_url(bike, format: :json)
