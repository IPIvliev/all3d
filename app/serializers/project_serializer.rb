class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :projectimage, :active, :user_id, :comments_count, :posts_count, :models_count, :products_count
end
