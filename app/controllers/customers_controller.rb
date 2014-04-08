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
  end

  def index
	  @customers = Customer.all
  end

  def edit
  end

  def update
  end
end
