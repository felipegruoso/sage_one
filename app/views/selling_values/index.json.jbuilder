json.array!(@selling_values) do |selling_value|
  json.extract! selling_value, :id, :value, :product_id
  json.url selling_value_url(selling_value, format: :json)
end
