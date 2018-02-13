class UpdateProfiles < ActiveRecord::Migration[5.0]
  def change

  	remove_column :profiles, :address
  	remove_column :profiles, :city
  	remove_column :profiles, :post_code
  	remove_column :profiles, :state
  	remove_column :profiles, :work_address
  	remove_column :profiles, :position
  
  	add_column :profiles, :address_line_1, :string
  	add_column :profiles, :address_line_2, :string
  	add_column :profiles, :address_city, :string
  	add_column :profiles, :address_lga, :string
  	add_column :profiles, :address_state, :string
  	add_column :profiles, :school, :string
  	add_column :profiles, :work_address_line_1, :string
  	add_column :profiles, :work_address_line_2, :string
  	add_column :profiles, :work_address_city, :string
  	add_column :profiles, :work_address_lga, :string
  	add_column :profiles, :work_address_state, :string
  	add_column :profiles, :social_network_group, :string
  	add_column :profiles, :course, :string

  	add_column :profiles, :work_email, :string
  	add_column :profiles, :school_email, :string


  end
end
