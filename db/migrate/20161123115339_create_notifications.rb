class CreateNotifications < ActiveRecord::Migration[5.0]
  def change

    create_table :notifications do |t|


    	t.integer  :guest_id

		t.integer  :party_id
		
		t.integer  :host_id
		
		t.boolean  :read
		    
		t.integer  :invite_id

		t.integer  :visitor_id

		   
      	t.timestamps

    end

    add_index :notifications, 'party_id'

    add_index :notifications, 'visitor_id'

   
  end
end
