class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :like, :dislike, :created_at

  belongs_to :user
  belongs_to :post
  belongs_to :model
end
