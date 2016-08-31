json.extract! bike,
  :id,
  :name,
  :serial_number,
  :model,
  :brand,
  :client_id,
  :bought_on,
  :created_at,
  :updated_at

json.url bike_url(bike, format: :json)
