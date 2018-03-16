class CreateFriendNotices < ActiveRecord::Migration[5.0]
	
  def change
    create_table :friend_notices do |t|

    	t.integer  "friend_id"
	    t.integer  "user_id"
	    t.datetime "read_at"
	    t.integer  "buddy_id"
	    t.integer  "pouch_id"
	    t.boolean  "action"

      t.timestamps
    end

    add_index :friend_notices, 'friend_id'
    add_index :friend_notices, 'user_id'
  end

end
