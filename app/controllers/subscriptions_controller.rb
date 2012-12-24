class SubscriptionsController < ApplicationController
  before_filter :paid_user

  def new
  	@user = current_user || User.new

  end

  def create
    @stripe_card_token = params[:stripe_card_token]
    logger.debug "THE CARD TOKEN IN create ACTION: #{params[:stripe_card_token]}"


    if @user = current_user
      create_subscription
    else
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        create_subscription
      else
        render 'new'
      end
    end
  end

  private
    def create_subscription
      
      @user.subscription.plan_id = params[:plan_id]
      @user.subscription.stripe_card_token = params[:stripe_card_token]
      logger.debug "THE CARD TOKEN IN create_subscription: #{params[:stripe_card_token]}"
      if @user.subscription.save_with_payment
        flash[:success] = "Thank you for purchasing!"
        flash[:success] += " Your subscription will expire in one year." if @user.subscription.plan_id == "swc_teacher"
        flash[:success] += " Your purchase is valid for printing 15 puzzles." if @user.subscription.plan_id == "swc_lite"
        redirect_to new_word_search_puzzle_path
      else
        render 'new'
      end
    end
    
    def paid_user
      logger.debug "Cookies: #{cookies[:remember_token]}"
      logger.debug "Signed in?: #{signed_in?}"
      logger.debug "Current User?: #{current_user}"
      logger.debug "Am I redirecting?"
      if signed_in? && current_user.subscription.paid_user?
        flash[:notify] = "You are already a paid member."
        logger.debug "YES!"
        redirect_to edit_user_path(current_user) 
      end
      logger.debug "NO :("
    end
end
