class Projectimage < ActiveRecord::Base
	has_attached_file :image, styles: { large: "800x600", medium: "320x200" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	belongs_to :project
end
