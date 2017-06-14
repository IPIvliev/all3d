class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :titile
      t.text :text
      t.text :description
      t.integer :like
      t.integer :dislike

      t.timestamps null: false
    end
  end
end
