json.array!(@phs) do |ph|
  json.extract! ph, :id
  json.url ph_url(ph, format: :json)
end
