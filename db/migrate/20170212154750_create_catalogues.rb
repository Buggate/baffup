class CreateCatalogues < ActiveRecord::Migration[5.0]

  def change
    create_table :catalogues do |t|

	  t.string   "file_name"

   	  t.integer  "party_id"


      t.timestamps

    end

    add_index :catalogues, "party_id"

  end
  
end
