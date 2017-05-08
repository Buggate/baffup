class AddRequestIdToNotifications < ActiveRecord::Migration[5.0]
  def change

  	add_column :notifications, :request_id, :integer


  end
end
