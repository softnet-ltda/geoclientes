class AdminUsersController < ApplicationController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]

  def new
	  @user = AdminUser.new
  end

  def create
	@user = AdminUser.new(params[:adminuser])
	@user.save
	render 'show'
  end

  def edit
  end

  def show
  end

  def index
	  @users = AdminUser.all
  end
end
