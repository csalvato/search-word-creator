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
			flash[:success] = "Welcome to the Search Word Creator!"
  		redirect_to new_word_search_puzzle_path
  	else
			render 'new'
  	end
  end

  def edit
  end

  def update
  end

  def dashboard
    redirect_to new_word_search_puzzle_path
  end

  private
    def signed_out_user
      redirect_to dashboard_url unless !signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to dashboard_url unless current_user?(@user)
    end
end
