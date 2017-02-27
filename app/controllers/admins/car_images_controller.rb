class Admins::CarImagesController < ApplicationController
	def create
		@car_image = CarImage.new(car_image_params)
		@car_image.save
	end

	private

	def car_image_params
		params.require(:car_image).permit(:id, :image, :car_id)
	end
end
