class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates :city, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

  # Images
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/img/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :posts
  has_many :comments, :dependent => :destroy
  has_many :models
  has_many :stls
  has_many :images

  # User rank
  has_merit

  # Votes
  acts_as_voter

  # Messages
  acts_as_messageable

  before_save :ensure_authentication_token

  # SEO Friendly id
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]  

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  def self.search(search)
    where("city LIKE ?", "%#{search}%") 
  end

  def normalize_friendly_id(text)
    text.to_slug.transliterate(:russian).normalize.to_s
  end

  def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end  

  private

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end 
end
