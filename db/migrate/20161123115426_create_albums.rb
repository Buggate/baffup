class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|

    	t.string   :caption
        t.integer  :party_id
        t.integer  :visitor_id

      t.timestamps
    end

    add_index :albums, 'party_id'

    add_index :albums, 'visitor_id'
  end
end
