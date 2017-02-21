class CarBrand < ApplicationRecord
	has_many :cars
	has_many :car_models

	validates :name, presence: true
end
