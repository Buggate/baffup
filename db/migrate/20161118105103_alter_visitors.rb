class AlterVisitors < ActiveRecord::Migration[5.0]
  def change


  	add_index("visitors", ["group_id", "invite_id"])


     add_index("visitors", ["user_id", "party_id"])

  end
end
