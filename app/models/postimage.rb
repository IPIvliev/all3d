class Postimage < ActiveRecord::Base
# Images
	has_attached_file :file, styles: { large: "640x480", medium: "300x240#", thumb: "100x100" }
	validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/

	belongs_to :post
end
