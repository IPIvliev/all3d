class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :last_sign_in_at

  has_many :posts
  has_many :comments
  has_many :models
end
