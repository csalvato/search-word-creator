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

require 'spec_helper'

describe Subscription do 
  let!(:user) { FactoryGirl.create(:user) }

  shared_examples_for Subscription do
		it { should respond_to(:user_id) }
		it { should respond_to(:user) }
		it { should respond_to(:pennies_paid) }
		it { should respond_to(:last_paid_at) }
		it { should respond_to(:subscription_expires_on) }
		it { should respond_to(:paid_user?) }
		it { should respond_to(:process_payment) }
		it { should respond_to(:trial_user) }
		it { should respond_to(:created_at) }
		it { should respond_to(:updated_at) }
		it { should respond_to(:stripe_card_token) }

		it "should have :stripe_card_token as an accessible attribute" do
			subscription.class.accessible_attributes.include?(:stripe_card_token).should be_false
		end

		it "should not have any accessible attributes (aside from stripe_card_token)" do
			subscription.class.accessible_attributes.include?(:user_id).should be_false
			subscription.class.accessible_attributes.include?(:pennies_paid).should be_false
			subscription.class.accessible_attributes.include?(:last_paid_at).should be_false
			subscription.class.accessible_attributes.include?(:subscription_expires_on).should be_false
			subscription.class.accessible_attributes.include?(:paid_user).should be_false
			subscription.class.accessible_attributes.include?(:trial_user).should be_false
		end

		describe "should be valid as created by factory" do
			it { should be_valid }
		end

		describe "when user_id is not present " do
			before { subscription.user_id = nil }

			it { should_not be_valid }
		end

		describe "when pennies_paid is not present " do
			before { subscription.pennies_paid = nil }

			it { should_not be_valid }
		end

		describe "when trial_user is not present " do
			before { subscription.trial_user = nil }

			it { should_not be_valid }
		end
	end

	describe "when the user has printed" do
		let(:built_puzzle) { user.word_search_puzzles.create( words: ["foobar", "foobaz"]) }
		describe "a single puzzle 15 times" do
			before do
				built_puzzle.times_printed = 15
				built_puzzle.save!
				user.subscription.save!
			end
			it { user.subscription.should_not be_trial_user}
		end
		describe "multiple puzzles totaling 15 times" do
			let(:other_built_puzzle) { user.word_search_puzzles.create( words: ["foobar", "foobaz"]) }
			before do
				other_built_puzzle.times_printed = 5
				other_built_puzzle.save!

				built_puzzle.times_printed = 10
				built_puzzle.save!

				user.subscription.save!
			end
			it { user.subscription.should_not be_trial_user}
		end
		describe "a single puzzle under 15 times" do
			before do
				built_puzzle.times_printed = 14
				built_puzzle.save!
				user.subscription.save!
			end
			it { user.subscription.should be_trial_user}
		end
		describe "multiple puzzles totaling under 15 times" do
			let(:other_built_puzzle) { user.word_search_puzzles.create( words: ["foobar", "foobaz"]) }
			before do
				other_built_puzzle.times_printed = 4
				other_built_puzzle.save!

				built_puzzle.times_printed = 10
				built_puzzle.save!

				user.subscription.save!
			end
			it { user.subscription.should be_trial_user}
		end
	end

  describe "trial subscriptions" do
	  let(:subscription) { user.subscription }
	  subject { subscription }

		it_behaves_like Subscription

		describe "when converted to paid user" do
			before do
				user.subscription.plan_id = "swc_teacher"
				user.subscription.stripe_card_token = 
					Stripe::Token.create( card: { number: "4242424242424242",
																exp_month: Date.today.month,
																exp_year: Date.today.year+1,
																cvc: 314  } ).id
				user.subscription.save_with_payment
			end
			
			it { should be_valid }
			it { should be_paid_user }
			it { should_not be_trial_user }
			specify { subscription.subscription_expires_on.to_s.should == 1.year.from_now.to_s}
		end
  end 

  describe "paid subscriptions" do
  	let!(:subscription) { user.subscription }

  	before do
  		subscription.pennies_paid =  2995
  		subscription.last_paid_at =  Time.now
	  	subscription.subscription_expires_on = 1.year.from_now
	  	subscription.trial_user = false
	  	subscription.created_at = 1.day.ago
	  	subscription.updated_at = Time.now
	  	subscription.save!
	  end

	  subject { subscription }

	  it_behaves_like Subscription
		
		describe "should not be a paid_subscription after expiration date" do
			before do
				subscription.subscription_expires_on = 1.minute.ago
			end
			
			it { should be_valid }
			it { should_not be_paid_user }
			it { should_not be_trial_user }
			specify { subscription.pennies_paid = 2995 }
		end

	end
	

end
