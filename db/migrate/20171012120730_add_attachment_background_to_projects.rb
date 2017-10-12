class AddAttachmentBackgroundToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :projects, :background
  end
end
