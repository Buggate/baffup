class AlterNotifications < ActiveRecord::Migration[5.0]
  def change

  	add_column :notifications, :comment, :integer
  	add_column :notifications, :album, :integer
  end
end
