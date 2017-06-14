class Model < ActiveRecord::Base
# Images
	has_attached_file :modelimage, styles: { large: "900x600", medium: "300x240#", thumb: "100x100" }, default_url: "/img/model_missing.png"
	validates_attachment_content_type :modelimage, content_type: /\Aimage\/.*\z/

	has_many :comments
	has_many :stls
	has_many :images
	belongs_to :user
end
