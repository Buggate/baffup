class RemoveCommentFromNotifications < ActiveRecord::Migration[5.0]
  def change
    remove_column :notifications, :comment, :integer
    remove_column :notifications, :album, :integer

    add_column :notifications, :comment_id, :integer
  	add_column :notifications, :album_id, :integer


  end
end
