class AddStripeCustomerTokenToSubscription < ActiveRecord::Migration
  def change
  	add_column :subscriptions, :stripe_customer_token, :string
  end
end
