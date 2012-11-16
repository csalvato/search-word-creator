class AddDefaultValuesToUsers < ActiveRecord::Migration
  def change
    change_column :users, :trial_user, :boolean, default: true
    change_column :users, :paid_user, :boolean, default: false
    change_column :users, :pennies_paid, :integer, default: 0
   end
end
