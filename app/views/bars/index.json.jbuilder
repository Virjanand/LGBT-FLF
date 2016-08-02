json.array!(@bars) do |bar|
  json.extract! bar, :id, :name, :description, :location_name, :location_latitude, :location_longitude, :url
  json.url bar_url(bar, format: :json)
end
