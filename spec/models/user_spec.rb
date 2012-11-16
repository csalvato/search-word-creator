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

require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }
	
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_token) }
	it { should respond_to(:last_paid_at) }
	it { should respond_to(:pennies_paid) }
	it { should respond_to(:subscription_expires_on) }
	it { should respond_to(:paid_user?) }
	it { should respond_to(:trial_user?) }
	it { should respond_to(:created_at) }
	it { should respond_to(:updated_at) }
	it { should respond_to(:admin) }
	it { should respond_to(:authenticate) }
	it { should respond_to(:word_search_puzzles) }

	it "should not have paid_user as an accessible attribute" do
		user.class.accessible_attributes.include?(:paid_user).should be_false
	end
	
	it "should not have trial_user as an accessible attribute" do
		user.class.accessible_attributes.include?(:trial_user).should be_false
	end

	describe "when name is not present" do
		before { user.name = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { user.email = " " }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org, example.user@foo.
										 foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				user.email = invalid_address
				user.should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be invalid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				user.email = valid_address
				user.should be_valid
			end
		end
	end

	describe "when email address is already taken" do
		let(:user_with_same_email) do
			user_with_same_email = user.dup
			user_with_same_email.email = user.email.upcase
			user_with_same_email
		end

		specify { user_with_same_email.should_not be_valid }
	end

  describe "when password is not present" do
    before { user.password = user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { user.password_confirmation = nil }
    it { should_not be_valid }
  end

	describe "return value of authenticate method" do
	  before { user.save }
	  let(:found_user) { User.find_by_email(user.email) }

	  describe "with valid password" do
	    it { should == found_user.authenticate(user.password) }
	  end

	  describe "with invalid password" do
	    let(:user_for_invalid_password) { found_user.authenticate("invalid") }

	    it { should_not == user_for_invalid_password }
	    specify { user_for_invalid_password.should be_false }
	  end

	  describe "with a password that's too short" do
			before { user.password = user.password_confirmation = "a" * 5 }
			it { should be_invalid }
	  end
	end

	describe "email address with mixed case" do
  	let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      user.email = mixed_case_email
      user.save
      user.reload.email.should == mixed_case_email.downcase
    end
  end

  describe "remember_token" do
  	before { user.save }
  	its(:remember_token) { should_not be_blank }
  end

	describe "with admin attribute set to 'true'" do
		before do
			user.save!
			user.toggle!(:admin)
		end

		it { should be_admin }
	end

	describe "with paid_user attribute set to 'true'" do
		before do
			user.save!
			user.toggle!(:paid_user)
			user.save!
		end

		it { should be_paid_user }
		it { should_not be_trial_user}
	end

	describe "with trial_user attribute set to 'false'" do
		before do
			user.save!
			user.toggle!(:trial_user)
		end

		it { should_not be_trial_user }
	end

end
