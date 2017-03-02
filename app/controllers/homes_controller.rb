class HomesController < ApplicationController

	def index
		@cars = Car.order(created_at: :desc).limit(8)
	end

end
