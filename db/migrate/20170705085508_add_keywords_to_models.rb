class AddKeywordsToModels < ActiveRecord::Migration
  def change
    add_column :models, :keywords, :string
    add_column :articles, :keywords, :string
    add_column :products, :keywords, :string
  end
end
