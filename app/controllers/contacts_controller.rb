class ContactsController < ApplicationController
  before_filter :authenticate_user!
  def create
	  @contact = Contact.new(params[:contact])
	  @contact.save
	  redirect_to '/customers'
  end
  def new
	  @contact = Contact.new
  end
  def index
	  @contacts = Contact.all
	  @event = Event.new
  end
  def show
	  @contact = Contact.find(params[:id])
	  @event = Event.new
  end
end
