class Project < ActiveRecord::Base
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
