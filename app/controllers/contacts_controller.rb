class ContactsController < ApplicationController
  def create
	  @contact = Contact.new(params[:contact])
	  @contact.save
	  render 'index'
  end
end