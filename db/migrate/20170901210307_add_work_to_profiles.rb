class AddWorkToProfiles < ActiveRecord::Migration[5.0]
  def change

  	add_column :profiles, :work_place, :string
  	add_column :profiles, :work_address, :text
  	add_column :profiles, :professional_skill, :string
  	add_column :profiles, :position, :string
  	add_column :profiles, :work_phone, :string
    

  end
end
