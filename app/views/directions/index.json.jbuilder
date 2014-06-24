json.array!(@directions) do |direction|
  json.extract! direction, :id, :order, :instruction
  json.url direction_url(direction, format: :json)
end
