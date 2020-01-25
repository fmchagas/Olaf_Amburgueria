json.extract! product, :id, :name, :description, :quantity, :tipe_product_id, :created_at, :updated_at
json.url product_url(product, format: :json)
