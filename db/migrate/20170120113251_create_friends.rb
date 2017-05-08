class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :buddy_id
      t.integer :invite_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
