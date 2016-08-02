json.array!(@cities) do |city|
  json.extract! city, :id, :name, :rating
  json.url city_url(city, format: :json)
end
