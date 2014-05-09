class ContactsController < ApplicationController
  def create
	  @contact = Contact.new(params[:contact])
	  @contact.save
	  render 'index'
  end
  def new
  end
  def index
	  @contacts = Contact.all
  end
  def show
	  @contact = Contact.find(params[:id])
  end
end
