class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :user_id, :null => false
      t.boolean :active, :null => false, :default => false
      t.integer :like, :null => false, :default => 0
      t.integer :dislike, :null => false, :default => 0
      t.string :pimage
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
