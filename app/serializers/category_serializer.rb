class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cimage

  has_many :posts
end
