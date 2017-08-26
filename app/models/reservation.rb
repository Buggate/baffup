class Reservation < ApplicationRecord


	    belongs_to :party

	
        belongs_to :visitor


        validates :accept, :inclusion => { :in => [true, false] }
        
end
