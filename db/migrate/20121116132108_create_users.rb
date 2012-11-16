class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.datetime :last_paid_at
      t.integer :pennies_paid
      t.datetime :subscription_expires_on
      t.boolean :paid_user
      t.boolean :trial_user

      t.timestamps
    end
  end
end
