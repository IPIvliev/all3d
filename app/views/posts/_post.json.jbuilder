json.extract! post, :id, :title, :text, :user_id, :active, :like, :dislike, :pimage, :category_id, :created_at, :updated_at
json.url post_url(post, format: :json)
