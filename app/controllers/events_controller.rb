class EventsController < ApplicationController
  before_filter :authenticate_user!

  def create
	  @event = Event.new(params[:event])
	  @event.user = User.find(params[:user_id])
	  @event.contact = Contact.find(params[:contact_id])
	  @event.save
	  redirect_to '/events'
  end
  def show
	  @event = Event.find(params[:id])
  end
  def index
	  @events = Event.all
	  @locs = []
	  Event.all.each do |e|
		  @point = [e.contact.name+" - "+e.contact.customer.name, e.contact.customer.latitude, e.contact.customer.longitude]
		  @locs.push(@point)
	  end

	      respond_to do |format|
			format.html # show.html.erb
		    format.json  { render :json => @events }
		  end
  end
  def check_in
	  @lat_lng = cookies[:lat_lng].split("|")
  end
end
