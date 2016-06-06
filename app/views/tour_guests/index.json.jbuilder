json.array!(@tour_guests) do |tour_guest|
  json.extract! tour_guest, :id, :tour_id, :guest_id
  json.url tour_guest_url(tour_guest, format: :json)
end
