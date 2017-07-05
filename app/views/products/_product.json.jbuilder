json.extract! product, :id, :title, :price, :user_id, :description, :project_id, :orders_count, :comments_count, :status, :active, :created_at, :updated_at
json.url product_url(product, format: :json)
