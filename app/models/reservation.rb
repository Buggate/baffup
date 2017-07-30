class Reservation < ApplicationRecord


	    belongs_to :party

	
        belongs_to :visitor


        validates_presence_of :accept
        
end
