class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.integer :model_id
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
