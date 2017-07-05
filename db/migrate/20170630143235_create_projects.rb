class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :projectimage
      t.boolean :active, default: false
      t.integer :user_id
      t.integer :comments_count, default: 0
      t.integer :posts_count, default: 0
      t.integer :models_count, default: 0
      t.integer :products_count, default: 0
      t.string :slug

      t.timestamps null: false
    end
    add_index :projects, :slug, unique: true  
  end
end    