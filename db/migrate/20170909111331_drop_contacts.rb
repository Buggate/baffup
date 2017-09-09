class DropContacts < ActiveRecord::Migration[5.0]
  def change

  	drop_table :contacts
  end
end
