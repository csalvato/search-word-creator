class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
			flash[:success] = "Welcome to the Sample App!"
  		redirect_to dashboard_path
  	else
			render 'new'
  	end
  end

  def edit
  end

  def update
  end

  def dashboard
  end
end
