class AddUrlToModels < ActiveRecord::Migration
  def change
    add_column :models, :url, :text
    add_column :models, :author, :string
  end
end
