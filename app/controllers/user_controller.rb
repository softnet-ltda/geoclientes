class UserController < ApplicationController
  def new
	  @user = User.new
  end

  def create
	@user = User.new(params[:user])
	@user.save
	render 'show'
  end

  def edit
  end

  def show
  end
end
