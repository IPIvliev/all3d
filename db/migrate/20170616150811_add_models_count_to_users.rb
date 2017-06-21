class AddModelsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :models_count, :integer, default: 0
  end
end
