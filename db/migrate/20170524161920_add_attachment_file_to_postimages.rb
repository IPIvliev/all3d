class AddAttachmentFileToPostimages < ActiveRecord::Migration
  def self.up
    change_table :postimages do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :postimages, :file
  end
end
