class AlterRecordComments < ActiveRecord::Migration[5.0]

  def change

  	add_reference :comments, :commentable, polymorphic: true

  end

end
