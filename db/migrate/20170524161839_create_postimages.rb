class CreatePostimages < ActiveRecord::Migration
  def change
    create_table :postimages do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :active

      t.timestamps null: false
    end
  end
end
