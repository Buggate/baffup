class AddPouchToFriends < ActiveRecord::Migration[5.0]
  def change

  	add_column :friends, :pouch_id, :integer
    
  	add_index :friends, 'pouch_id'


  end
end
