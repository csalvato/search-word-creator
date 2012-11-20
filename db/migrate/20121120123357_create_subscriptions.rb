class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :pennies_paid
      t.datetime :last_paid_at
      t.datetime :subscription_expires_on
      t.boolean :paid_user
      t.boolean :trial_user

      t.timestamps
    end

    remove_column :users, :last_paid_at
    remove_column :users, :pennies_paid
    remove_column :users, :paid_user
    remove_column :users, :trial_user
  end
end
