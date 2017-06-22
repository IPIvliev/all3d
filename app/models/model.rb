class Model < ActiveRecord::Base
# Images
	has_attached_file :modelimage, styles: { large: "900x600", medium: "300x240#", thumb: "100x100" }, default_url: "/img/model_missing.png"
	validates_attachment_content_type :modelimage, content_type: /\Aimage\/.*\z/

	has_many :comments, :dependent => :destroy
	has_many :stls, :dependent => :destroy
	has_many :images, :dependent => :destroy
	belongs_to :user, counter_cache: true

	# Searching
	def self.search(search)
	  where("title LIKE ?", "%#{search}%") 
	end

end
