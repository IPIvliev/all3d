class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :description, :like, :dislike, :active, :ancestry, :created_at
end
