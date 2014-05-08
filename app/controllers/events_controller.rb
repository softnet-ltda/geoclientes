class EventsController < ApplicationController
  def create
	  @event = Event.new(params[:event])
	  @event.save
	  render 'index'
  end
end
