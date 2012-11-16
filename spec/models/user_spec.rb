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
#  pennies_paid            :integer
#  subscription_expires_on :datetime
#  paid_user               :boolean
#  trial_user              :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
