class AddCategoryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category, :string
    add_column :posts, :author, :string
    add_column :posts, :for_translation, :boolean, default: false
    add_column :posts, :translate, :boolean, default: false
    add_column :posts, :url, :string
    add_column :posts, :date_of_creation, :date
    add_column :posts, :description, :text
    add_column :posts, :keywords, :text
  end
end
