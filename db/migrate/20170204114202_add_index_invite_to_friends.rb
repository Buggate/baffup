class AddIndexInviteToFriends < ActiveRecord::Migration[5.0]
  
  def change

  	 add_index("friends", ["invite_id"])

  end
  
end
