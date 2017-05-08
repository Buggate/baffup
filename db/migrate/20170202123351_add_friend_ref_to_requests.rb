class AddFriendRefToRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :requests, :friend, foreign_key: true
  end
end
