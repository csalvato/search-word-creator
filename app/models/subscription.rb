# == Schema Information
#
# Table name: subscriptions
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  pennies_paid            :integer          default(0)
#  last_paid_at            :datetime
#  subscription_expires_on :datetime
#  trial_user              :boolean          default(TRUE)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  plan_id                 :string(255)
#  stripe_customer_token   :string(255)
#

class Subscription < ActiveRecord::Base
	attr_accessor :stripe_card_token

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

	# With Stripe, do I even NEED all this shit?!?
	def process_payment( pennies_paid = 2995, subscription_expires_on = 1.year.from_now )
		self.pennies_paid = pennies_paid
		self.last_paid_at = Time.now
	  self.subscription_expires_on = subscription_expires_on
	  self.save!
	end

	def save_with_payment
		if self.valid?
			customer = Stripe::Customer.create(description: self.user.email, 
																				 plan: self.plan_id,
																				 card: self.stripe_card_token )
			self.stripe_customer_token = customer.id
			self.save!
		end
	rescue Stripe::InvalidRequestError => e
  logger.error "Stripe error while creating customer: #{e.mesage}"
  errors.add :base, "There was a problem with your credit card."
	end

end
