# == Schema Information
#
# Table name: subscriptions
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  pennies_paid            :integer
#  last_paid_at            :datetime
#  subscription_expires_on :datetime
#  paid_user               :boolean
#  trial_user              :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Subscription < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :pennies_paid, presence: true
	validates :trial_user, :inclusion => { :in => [true, false] }

	# Not sure why, but this must hapeen after_validation, 
	#   not before_save or before_validation...
	after_validation { self.trial_user = false if self.paid_user? }

	def paid_user?
		if subscription_expires_on.nil?
			false
		else 
			subscription_expires_on > Time.now
		end
	end

	def process_payment( pennies_paid = 2995, subscription_expires_on = 1.year.from_now )
		self.pennies_paid = pennies_paid
		self.last_paid_at = Time.now
	  self.subscription_expires_on = subscription_expires_on
	end

end
