class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|


    	t.string  :name
	    t.integer :party_id
	    t.integer :host_id
	    t.integer :visitor_id
	    t.boolean :accept, default: false

        t.timestamps

     end

     add_index :reservations, 'party_id'

     add_index :reservations, 'visitor_id'
  end
end


