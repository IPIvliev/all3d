class CreateProjectimages < ActiveRecord::Migration
  def change
    create_table :projectimages do |t|
      t.integer :project_id
      t.has_attached_file :image  
      t.timestamps null: false
    end
  end
end
