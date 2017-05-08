class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|

         t.string :email 
         t.integer :group_id
        t.integer :host_id
        t.integer :guest_id
        t.string :token

      t.timestamps 

    end

    add_index("invites", ["group_id", "host_id", "guest_id"])
  end
end
