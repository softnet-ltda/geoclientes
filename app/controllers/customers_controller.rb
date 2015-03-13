require 'csv'
class CustomersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :deny_access, :unless => :supervisor?, :only => :new

  def new
	  @customer = Customer.new
  end

  def create
	  @customer = Customer.new(params[:customer])
	  @customer.account = current_user.account
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
	  @customers = Customer.where("account = ?",current_user.account)
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

 def load_customers
 end
 def load_customers_update
   count=0
   begin
     if !params[:upload_customers].nil?

       filepath = params[:upload_users].tempfile.path

       CSV.foreach(filepath) do |row|
         name = row[0]
         email = row[1]
         count = count + 1
         if Customer.find_by_name(name).nil?
           Customer.create(:name => name, :email => email)
         end
       end
     end

   rescue Exception => ex
     error = true
     flash[:notice] = "Archivo invalido: "+ex.message
   end

   if !error
       redirect_to customers_path
       if count == 1
         flash[:notice] = "1 cliente ingresado exitosamente"
       else
         flash[:notice] = count.to_s+" clientes ingresados exitosamente"
       end
   else
       redirect_to customers_path
   end
 end

  def update
	  @customer = Customer.find(params[:id])
	  @customer.update_attributes(params[:customer])
	  @customer.save
	  render 'show'
  end
  def supervisor?
    current_user.role < 2
  end
  def disable
	@customer = Customer.find(params[:id])
	@customer.switch_status!
  end
end
