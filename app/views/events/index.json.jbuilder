json.array!(@events) do |event|
  json.extract! event, :id, :, :description, :rails, :g, :scaffold, :location_name, :location_latitude, :location_longitude, :url
  json.url event_url(event, format: :json)
end
