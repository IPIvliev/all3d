class CreateStls < ActiveRecord::Migration
  def change
    create_table :stls do |t|
      t.integer :user_id
      t.integer :model_id

      t.timestamps null: false
    end
  end
end
