class CustomersController < ApplicationController
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
	  @loc = []
	  @point = [@customer.name, @customer.latitude, @customer.longitude]
	  @loc.push(@point)
	  
  end

  def index
	  @customers = Customer.all
	  @locs = []
	  @customer.each do |c|
		  @point = [c.name, c.latitude, c.longitude]
		  @locs.push(@point)
	  end
  end

  def edit
  end

  def update
  end
end
