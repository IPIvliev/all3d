class Post < ActiveRecord::Base

	has_many :comments
	has_many :postimages
	belongs_to :category
	belongs_to :user

	#Translations
	translates :title, :text, :description, :keywords
	globalize_accessors :locales => [:ru, :en], :attributes => [:title, :text]

	# Votes
	acts_as_votable

	# Views counter
	is_impressionable :counter_cache => true, column_name: :visits, :unique => :session_hash

	# SEO Friendly id
	extend FriendlyId
	friendly_id :slug_candidates, use: [:slugged, :finders]

	def normalize_friendly_id(text)
	  text.to_slug.transliterate(:russian).normalize.to_s
	end
	
	def slug_candidates
		[
		  :title,
		  [:title, :id]
		]
	end

	def postimage_from_url(url)
		self.postimages.create(open(url))
	end

end
