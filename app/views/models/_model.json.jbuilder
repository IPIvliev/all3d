json.extract! model, :id, :title, :description, :mimage, :active, :user_id, :like, :dislike, :created_at, :updated_at
json.url model_url(model, format: :json)
