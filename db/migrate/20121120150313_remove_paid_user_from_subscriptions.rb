class RemovePaidUserFromSubscriptions < ActiveRecord::Migration
  def change
  	remove_column :subscriptions, :paid_user
  end
end
