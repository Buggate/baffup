class DropMedia < ActiveRecord::Migration[5.0]
  def change

  	drop_table :media
  	
  end
end
