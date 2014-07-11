class UsersController < ApplicationController

  before_filter :authenticate_user!

  def new
	  @user = User.new
  end

  def create
	@user.new(params[:user])
	@user.role = 0
	@user.save
	render 'show'
  end

  def edit
	  @user = User.find(params[:id])
  end

  def show
	  @user = User.find(params[:id])
	  @supervisor_candidates = User.where("role < 2")
  end

  def update
	  @user = User.find(params[:id])
	  @user.update_attributes(params[:user])
	  redirect_to @user
  end

  def index
	  @users = User.all
  end

end
