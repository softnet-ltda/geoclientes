class CustomersController < ApplicationController
  def new
	  @customer = Customer.new
  end

  def create
	  @customer = Customer.new(params[:user])
  end

  def show
  end

  def index
	  @customers = Customer.all
  end

  def edit
  end

  def update
  end
end
