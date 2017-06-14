class ChangeArticle < ActiveRecord::Migration
  def self.up
    rename_column :articles, :titile, :title
  end

  def self.down
    rename_column :articles, :title, :titile
  end
end
