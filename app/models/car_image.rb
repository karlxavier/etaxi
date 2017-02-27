class CarImage < ApplicationRecord
	belongs_to :car

	validates :car_id, presence: true
	mount_uploader :image, ImageUploader
end
