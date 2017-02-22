class Car < ApplicationRecord
	belongs_to :car_brand
	belongs_to :car_model
	belongs_to :fuel_type
	belongs_to :car_color
	belongs_to :car_status
	before_create :generate_ref_code

	validates :year, :mileage, :price, :primary_image, presence: true
	validates_numericality_of :year, :price, allow_nil: false

	mount_uploader :primary_image, PrimaryImageUploader

	private

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
