class AddAttachmentFileToStls < ActiveRecord::Migration
  def self.up
    change_table :stls do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :stls, :file
  end
end
