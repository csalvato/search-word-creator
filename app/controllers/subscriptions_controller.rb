class SubscriptionsController < ApplicationController
  def new
  	@user = current_user || User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
			flash[:success] = "Welcome to the Search Word Creator!"
  		redirect_to new_word_search_puzzle_path
  	else
			render 'new'
  	end
  end
end
