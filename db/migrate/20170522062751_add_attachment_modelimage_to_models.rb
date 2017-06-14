class AddAttachmentModelimageToModels < ActiveRecord::Migration
  def self.up
    change_table :models do |t|
      t.attachment :modelimage
    end
  end

  def self.down
    remove_attachment :models, :modelimage
  end
end
