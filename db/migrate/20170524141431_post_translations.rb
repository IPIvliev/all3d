class PostTranslations < ActiveRecord::Migration
  def self.up
    Post.create_translation_table!
  end
 
  def self.down
    Post.drop_translation_table!
  end
end
