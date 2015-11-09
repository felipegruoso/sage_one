json.array!(@products) do |product|
  json.extract! product, :id, :unity, :description, :identification, :cost, :observation, :provider, :stock, :bar_code, :min_stock, :max_stock, :stock_purchase, :factor, :ncm, :brand, :weight, :size, :inactive, :kind, :composition, :feedstock, :expedient_material, :for_sale, :currency, :code, :ipi, :gender
  json.url product_url(product, format: :json)
end
