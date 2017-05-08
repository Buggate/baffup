class Friend < ApplicationRecord


	belongs_to :user

    belongs_to :buddy, :class_name => 'User', optional: true


         has_many :friend_requests, :class_name => "Request", :foreign_key => 'friend_id'
         has_many :sent_request, :class_name => "Request", :foreign_key => 'host_id'


         belongs_to :invite
 

end
