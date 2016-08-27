json.partial! "bikes/bike", bike: @bike
# json.parts @bike.parts, :created_at

json.parts @bike.parts do |part|
  json.partial! "parts/part", part: part
end
# json.partial! "bikes/bike", bike: @bike
