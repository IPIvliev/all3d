class Project < ActiveRecord::Base
	has_attached_file :logo, styles: { medium: "320x200" }
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

	has_attached_file :background, styles: { large: "800x600" }
	validates_attachment_content_type :background, content_type: /\Aimage\/.*\z/

	belongs_to :user
	has_many :posts
	has_many :models
	has_many :comments, :dependent => :destroy
	has_many :projectimages, :dependent => :destroy

	# SEO Friendly id
	extend FriendlyId
	friendly_id :slug_candidates, use: [:slugged, :finders]

	# Searching
	def self.search(search)
	  where("title LIKE ?", "%#{search}%") 
	end

	def normalize_friendly_id(text)
	  text.to_slug.transliterate(:russian).normalize.to_s
	end

	def slug_candidates
		[
		  :title,
		  [:title, :id]
		]
	end
		
end
