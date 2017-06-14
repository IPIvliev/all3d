class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :like, :null => false, :default => 0
      t.integer :dislike, :null => false, :default => 0
      t.integer :post_id
      t.integer :model_id
      t.integer :user_id, :null => false

      t.timestamps null: false
    end
  end
end
