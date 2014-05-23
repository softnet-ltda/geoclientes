class UsersController < ApplicationController
  def new
	  @user = User.new
  end

  def create
	@user = User.new(params[:user])
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
