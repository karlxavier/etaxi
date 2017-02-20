class Admins::CarsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_car, only: [:show, :edit, :update, :delete]

	private

	def set_car
		@car = Car.find(params[:id])
	end
end
