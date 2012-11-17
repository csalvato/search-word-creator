# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  email                   :string(255)
#  password_digest         :string(255)
#  remember_token          :string(255)
#  last_paid_at            :datetime
#  pennies_paid            :integer          default(0)
#  subscription_expires_on :datetime
#  paid_user               :boolean          default(FALSE)
#  trial_user              :boolean          default(TRUE)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  admin                   :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

	has_many :word_search_puzzles, dependent: :destroy

	# Not sure why, but this must hapeen after_validation, 
	#   not before_save or before_validation...
	after_validation { self.trial_user = false if self.paid_user? }

	before_save { self.email.downcase! }
  before_save :create_remember_token

	VALID_NAME_REGEX = /\A[A-Z-]+[\s{1}][ A-Z-]+\Z/i
	validates :name, presence: true, 
									 length: { maximum: 50 }, 
									 format: { with: VALID_NAME_REGEX }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  									uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }  									
	validates_confirmation_of :password
	validates :password_confirmation, presence: true

	private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
