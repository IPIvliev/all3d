# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      # score 10, :on => 'users#create' do |user|
      #   user.bio.present?
      # end
      #
       score 2, :on => 'posts#upvote', :to => :user
       score -1, :on => 'posts#downvote', :to => :user

       score 1, :on => 'posts#upvote'
       score 1, :on => 'posts#downvote'
      #
       score 1, :on => [
         'comments#new',
       ]
       score 10, :on => [
         'posts#create',
       ]
      #
       score 15, :on => [
         'models#create',
       ]
      #      
    end
  end
end
