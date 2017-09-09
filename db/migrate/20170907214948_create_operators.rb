class CreateOperators < ActiveRecord::Migration[5.0]
  def change
    create_table :operators do |t|

      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => '', :null => false
      t.string   "password_digest"
      t.string   "username", limit: 25

       t.datetime "created_at"
       t.datetime "updated_at"


      t.timestamps
    end
  end
end

