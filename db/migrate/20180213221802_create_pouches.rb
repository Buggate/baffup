class CreatePouches < ActiveRecord::Migration[5.0]

  def change
    create_table :pouches do |t|

      t.integer  "user_id"

      t.timestamps
    end

     add_index :pouches, 'user_id'
  end
  
end

