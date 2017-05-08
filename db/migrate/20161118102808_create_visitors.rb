class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|

      t.integer :user_id
      t.integer :group_id
      t.integer :invite_id
      t.integer :party_id

      t.timestamps
    end

    add_index("visitors", ["invite_id", "user_id", "party_id"], :unique => true, :name => 'my_index')       



  end
end
