class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :title
      t.text :description
      t.string :mimage
      t.boolean :active, :null => false, :default => false
      t.integer :user_id, :null => false
      t.integer :like, :null => false, :default => 0
      t.integer :dislike, :null => false, :default => 0

      t.timestamps null: false
    end
  end
end
