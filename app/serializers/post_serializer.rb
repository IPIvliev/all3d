class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :user_id, :active, :like, :dislike, :pimage,
  :category_id, :title_en, :title_ru, :text_en, :text_ru, :created_at

  belongs_to :category
  belongs_to :user
  has_many :comments  
end
