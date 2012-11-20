class SubscriptionsController < ApplicationController
  def new
  	@user = current_user || User.new
  end

  def create
  	@user = User.find_by_email(params[:email])
  	@stripe_card_token = params[:stripe_card_token]
  	if !@user.nil?
  		@user.name = params[:name]
			@user.password = @user.password_confirmation = params[:password]
  	else
  		@user = current_user || User.new(params[:user])
  	end
  	if @user.save
  		@user.subscription.plan_id = params[:plan_id]
  		@user.subscription.stripe_card_token = params[:stripe_card_token]	
  		@user.subscription.save_with_payment
      sign_in @user
			flash[:success] = "Thank you for your purchase!  Your subscription will expire in one year."
  		redirect_to new_word_search_puzzle_path
  	else
			render 'new'
  	end
  end
end
