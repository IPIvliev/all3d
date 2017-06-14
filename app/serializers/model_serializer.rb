class ModelSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :mimage, :active, :user_id, :like,
   :dislike, :created_at
end
