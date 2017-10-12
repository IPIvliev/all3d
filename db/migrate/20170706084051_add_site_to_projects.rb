class AddSiteToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :site, :string
    add_column :projects, :keywords, :string
  end
end
