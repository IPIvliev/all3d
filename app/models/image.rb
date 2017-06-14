class Image < ActiveRecord::Base
	# Images
	has_attached_file :file, styles: { large: "800x600#", medium: "320x200#", thumb: "100x100#" }
	validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/

	belongs_to :user
	belongs_to :model
end
