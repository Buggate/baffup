class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|

        t.string  :name
	    t.text    :body
	    t.integer  :group_id
	    t.integer  :user_id
	    t.integer  :parent_id
	    t.integer  :visitor_id

	    t.timestamps
    end

     add_index("comments", ["group_id", "parent_id"])


     add_index("comments", ["user_id", "visitor_id"])

   
  end
end
