class Notification < ApplicationRecord

	    #belongs_to :host, class_name: 'User',  optional: true
		#belongs_to :guest, class_name: 'User',  optional: true  
		belongs_to :invite 
		belongs_to :request
	    #belongs_to :comment 
	    #belongs_to :album
		belongs_to :party 
		belongs_to :visitor, dependent: :destroy
		belongs_to :user


end

