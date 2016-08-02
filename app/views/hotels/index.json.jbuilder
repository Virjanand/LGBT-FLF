json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :name, :description, :location_name, :location_latitude, :location_longitude, :url
  json.url hotel_url(hotel, format: :json)
end
