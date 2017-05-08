class Reservation < ApplicationRecord


	    belongs_to :party
	
        belongs_to :visitor
        
end
