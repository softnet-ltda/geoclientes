class HomeController < ApplicationController
	def index
	end
	def locate
		@address = params[:q]
		render json: Geocoder.coordinates(@address).to_json
	end
end
