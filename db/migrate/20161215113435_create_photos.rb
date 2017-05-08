class CreatePhotos < ActiveRecord::Migration[5.0]
  
  def change
    
    create_table :photos do |t|

        t.integer  :party_id
        t.integer  :visitor_id

      t.timestamps
    end

    add_index :photos, 'party_id'

    add_index :photos, 'visitor_id'
  end

end
