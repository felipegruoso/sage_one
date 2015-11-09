json.array!(@categories) do |category|
  json.extract! category, :id, :description, :product_id
  json.url category_url(category, format: :json)
end
