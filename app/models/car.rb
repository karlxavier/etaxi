class Car < ApplicationRecord
	before_create :generate_ref_code

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
