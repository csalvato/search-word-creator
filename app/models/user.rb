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

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  

end
