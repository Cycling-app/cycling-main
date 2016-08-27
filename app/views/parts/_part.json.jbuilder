json.extract! part, :id,
  :part_type,
  :description,
  :serial_number,
  :bike_id,
  :distance_in_km,
  :lifetime_in_km,
  :lifetime_in_days,
  :created_at,
  :updated_at
json.url part_url(part, format: :json)
