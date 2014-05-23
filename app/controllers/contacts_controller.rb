class ContactsController < ApplicationController
  before_filter :authenticate_user!
  def create
	  @contact = Contact.new(params[:contact])
	  @contact.save
	  render 'show'
  end
  def new
	  @contact = Contact.new
  end
  def index
	  @contacts = Contact.all
  end
  def show
	  @contact = Contact.find(params[:id])
  end
end
