class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :titile, :text, :description, :like, :dislike
end
