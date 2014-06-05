json.array!(@venues) do |venue|
  json.extract! venue, :id, :nombre, :direccion, :latitud, :longitud
  json.url venue_url(venue, format: :json)
end
