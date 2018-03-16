class AddActionToFriendNotices < ActiveRecord::Migration[5.0]
  def change



  	remove_column :friend_notices, :action, :boolean


  	add_column :friend_notices, :action, :boolean, :default => false
  end
end
