class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|


    	t.string   "title"
	    t.string   "name"
	    t.string   "username"
	    t.string	"email"
	    t.date     "age"
	    t.string   "gender"
	    t.integer   "telephone"
	    t.string   "hobbies"
	    t.integer  "user_id"

      t.timestamps
    end
    add_index :profiles, 'user_id'
  end
end
