class AlterProfile < ActiveRecord::Migration[5.0]
  def change

  	remove_column :profiles, :telephone, :text
  	remove_column :profiles, :hobbies, :string

  	add_column :profiles, :telephone, :string
  	add_column :profiles, :hobbies, :text
  end
end
