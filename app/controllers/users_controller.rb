class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :dashboard]
  before_filter :correct_user, only: [:edit]
  before_filter :signed_out_user, only: [:create, :new]

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

  private
    def signed_out_user
      redirect_to dashboard_url unless !signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
end
