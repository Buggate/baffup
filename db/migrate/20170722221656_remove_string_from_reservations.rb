class RemoveStringFromReservations < ActiveRecord::Migration[5.0]
  def change

  	remove_column :reservations, :string, :string
  	remove_column :reservations, :title, :string

  end
end
