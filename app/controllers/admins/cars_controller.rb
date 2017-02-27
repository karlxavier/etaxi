class Admins::CarsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_car, only: [:show, :edit, :update, :delete]

	def index
		@cars = Car.all
	end

	def show
	end

	def new
		@car = Car.new
	end

	def create
		@car = Car.new(car_params)
		@car.car_status_id = 1
		respond_to do |format|
			if @car.save
				if params[:images]
			        params[:images].each { |image|
			         	@car.car_images.create(image: image)
			        }
			    end
				format.html { redirect_to admins_cars_path }
			else
				@car.errors.full_messages.each do |e|
					puts "-----------------------------------"
					puts e
				end
				format.html { render 'new' }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @car.update_attributes(car_params)
				if params[:images]
			        params[:images].each { |image|
			         	@car.car_images.create(image: image)
			        }
			    end
				format.html { redirect_to admins_cars_path }
			else
				format.html { render 'edit' }
			end
		end
	end

	private

	def car_params
		params.require(:car).permit(:reference_code, :year, :mileage, :power, :engine, :price, :car_brand_id, :car_model_id, :fuel_type_id, :car_color_id, :car_status_id, :primary_image)
	end

	def set_car
		@car = Car.find(params[:id])
	end
end
