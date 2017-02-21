class CarModel < ApplicationRecord
	has_many :cars
	belongs_to :car_brand

	validates :name, presence: true
end
