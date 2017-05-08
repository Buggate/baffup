class AddUserRefToFriends < ActiveRecord::Migration[5.0]
  def change
    add_reference :friends, :user, foreign_key: true
  end
end
