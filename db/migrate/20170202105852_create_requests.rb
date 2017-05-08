class CreateRequests < ActiveRecord::Migration[5.0]

  def change

    create_table :requests do |t|
		
		t.string :email 
        t.integer :host_id
        t.integer :guest_id
        t.integer :party_id
        t.string :token

      t.timestamps 

    end

    add_index("requests", ["party_id"])

    add_index("requests", ["host_id"])


    add_index("requests", ["guest_id"])


  end
end

