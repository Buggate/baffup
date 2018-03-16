class FriendNotice < ApplicationRecord


  	belongs_to :user

  	belongs_to :pouch

  	belongs_to :buddy

  	belongs_to :friend, :class_name => 'User', optional: true

  	
end
