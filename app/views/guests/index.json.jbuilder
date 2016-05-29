json.array!(@guests) do |guest|
  json.extract! guest, :id, :first, :last, :alias
  json.url guest_url(guest, format: :json)
end
