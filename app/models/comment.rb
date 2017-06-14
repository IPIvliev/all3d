class Comment < ActiveRecord::Base
	has_ancestry
	
	belongs_to :post
	belongs_to :model
	belongs_to :user

	# Votes
	acts_as_votable
end
