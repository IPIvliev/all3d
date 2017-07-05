class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price, default: 0
      t.integer :user_id
      t.text :description
      t.integer :project_id
      t.integer :orders_count, default: 0
      t.integer :comments_count, default: 0
      t.boolean :status, default: false
      t.boolean :active, default: false
      t.string :slug

      t.timestamps null: false
    end
    add_index :products, :slug, unique: true  
  end
end
