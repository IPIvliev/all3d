json.extract! article, :id, :titile, :text, :description, :like, :dislike, :created_at, :updated_at
json.url article_url(article, format: :json)
