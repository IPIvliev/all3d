class Contact < ActiveRecord::Base
	validates :name, presence: true, allow_blank: false
	validates :phone, presence: true, allow_blank: false
	validates :text, presence: true, allow_blank: false

end
