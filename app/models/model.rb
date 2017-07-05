class Model < ActiveRecord::Base
# Images
	has_attached_file :modelimage, styles: { large: "900x600", medium: "300x240#", thumb: "100x100" }, default_url: "/img/model_missing.png"
	validates_attachment_content_type :modelimage, content_type: /\Aimage\/.*\z/

	has_many :comments, :dependent => :destroy
	has_many :stls, :dependent => :destroy
	has_many :images, :dependent => :destroy
	belongs_to :user, counter_cache: true
	belongs_to :project, counter_cache: true

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
