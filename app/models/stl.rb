class Stl < ActiveRecord::Base
	has_attached_file :file, :path => ":rails_root/public/models/:id/:basename",
		:url => "/models/:id/:basename"
	validates_attachment_content_type :file, :content_type => ["application/zip", "application/x-zip",
		"application/x-zip-compressed","application/octet-stream"]

	belongs_to :user
	belongs_to :model
end
