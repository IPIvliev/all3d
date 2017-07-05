json.extract! project, :id, :title, :description, :projectimage, :active, :user_id, :comments_count, :posts_count, :models_count, :products_count, :created_at, :updated_at
json.url project_url(project, format: :json)
