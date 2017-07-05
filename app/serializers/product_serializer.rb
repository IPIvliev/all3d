class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :user_id, :description, :project_id, :orders_count, :comments_count, :status, :active
end
