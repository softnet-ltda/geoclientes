class UsersController < ApplicationController

  before_filter :authenticate_user!

  def new
	  @user = User.new
  end

  def create
	@user.new(params[:user])
	@user.name = @user.email.split("@").first
	@user.role = 0
	@user.save
	render 'show'
  end

  def events
	  @user = User.find(params[:id])
	  @customers = Customer.near([@user.latitude, @user.longitude], 5)
	  require 'set'
	  @customer_set = @customers.to_set
	  @locs = []
	  @events = @user.events
	  @events.keep_if{ |e| @customer_set.include?(e.contact.customer) }
	  @events.keep_if{ |e| e.status != 1 }
	  @customers.each do |c|
		  @point = [c.name, c.latitude, c.longitude]
		  @locs.push(@point)
	  end
  end
  def edit
	  @user = User.find(params[:id])
  end

  def show
	  @user = User.find(params[:id])
	  @events = @user.events
	  @supervisor_candidates = User.where("role < 2").keep_if{|e| e.id != params[:id].to_i}
  end

  def update
	  @user = User.find(params[:id])
	  @user.update_attributes(params[:user])
	  redirect_to @user
  end

  def index
	  @users = User.where("account = ?",current_user.account)
  end
  def locate
	  @user = User.find(params[:id])
	  @user.latitude = params[:latitude].to_f
	  @user.longitude = params[:longitude].to_f
	  @user.save
	  respond_to do |format|
	    format.js   {}
	    format.html   {}
	    format.json   {}
	  end
  end

end
