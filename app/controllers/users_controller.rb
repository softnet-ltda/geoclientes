class UsersController < ApplicationController
  def new
	  @user = User.new
  end

  def create
	@user = User.new(params[:user])
	if current_user.nil?
		@user.role = 0
	else
		@user.role = 2
		@user.supervisor_id = current_user.id
	end
	@user.save
	render 'show'
  end

  def edit
	  @user = User.find(params[:id])
  end

  def show
  end

  def index
	  @users = User.all
  end
end
