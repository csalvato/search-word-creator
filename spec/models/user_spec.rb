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
	it { should respond_to(:paid_user) }
	it { should respond_to(:trial_user) }
	it { should respond_to(:created_at) }
	it { should respond_to(:updated_at) }

end
