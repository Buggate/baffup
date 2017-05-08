class RemoveIndexVisitorFromPhoto < ActiveRecord::Migration[5.0]
  def change


    remove_index :photos, :visitor_id


  end
end
