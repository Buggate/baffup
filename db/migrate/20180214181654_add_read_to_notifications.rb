class AddReadToNotifications < ActiveRecord::Migration[5.0]
  def change


  	remove_column :notifications, :read, :boolean
  	remove_column :notifications, :comment_id
  	remove_column :notifications, :album_id


  	add_column :notifications, :read, :boolean, :default => false

  end
end
