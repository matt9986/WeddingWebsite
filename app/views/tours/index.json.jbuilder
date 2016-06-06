json.array!(@tours) do |tour|
  json.extract! tour, :id, :title
  json.url tour_url(tour, format: :json)
end
