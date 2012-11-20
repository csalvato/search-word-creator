class AddDefaultValuesToSubscriptions < ActiveRecord::Migration
  def change
  	change_column :subscriptions, :trial_user, :boolean, default: true
    change_column :subscriptions, :paid_user, :boolean, default: false
    change_column :subscriptions, :pennies_paid, :integer, default: 0
  end
end
