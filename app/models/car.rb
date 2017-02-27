class Car < ApplicationRecord
	belongs_to :car_brand
	belongs_to :car_model
	belongs_to :fuel_type
	belongs_to :car_color
	belongs_to :car_status
	has_many :car_images
	# before_create :set_car_status_available
	before_create :generate_ref_code

	validates :year, :mileage, :price, presence: true
	validates_numericality_of :year, allow_nil: false
	validates :price, numericality: true

	accepts_nested_attributes_for :car_images
	mount_uploader :primary_image, PrimaryImageUploader

	private

	def set_car_status_available
		self.car_status_id = 1
	end

	def generate_ref_code
	    reference_code = 'ET'
	    if Car.count == 0
	      	self.reference_code = "#{reference_code}-00001"
	    else
	    	last_reference_code = Car.last.reference_code
	    	number = last_reference_code.split('-')[1].to_i
	      	number += 1
	      	self.reference_code = reference_code + '-' + "%05d" % number
	    end
	end

end
