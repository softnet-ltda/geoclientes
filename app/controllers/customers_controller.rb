class CustomersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_supervisor!, :only => :new

  def new
	  @customer = Customer.new
  end

  def create
	  @customer = Customer.new(params[:customer])
	  @customer.save
	  render 'show'
  end

  def show
	  @customer = Customer.find(params[:id])
	  @event = Event.new
	  @loc = []
	  @point = [@customer.name, @customer.latitude, @customer.longitude]
	  @loc.push(@point)
	  
  end

  def index
	  @customers = Customer.all
	  @customer = Customer.new
	  @locs = []
	  @customers.each do |c|
		  @point = [c.name, c.latitude, c.longitude]
		  @locs.push(@point)
	  end
  end

  def edit
	  @customer = Customer.find(params[:id])
  end

  def update
	  @customer = Customer.find(params[:id])
	  @customer.update_attributes(params[:customer])
	  @customer.save
	  render 'show'
  end
end
