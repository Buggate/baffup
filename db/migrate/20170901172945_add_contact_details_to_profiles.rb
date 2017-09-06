class AddContactDetailsToProfiles < ActiveRecord::Migration[5.0]
  def change

  	add_column :profiles, :mobile, :string
  	add_column :profiles, :address, :text
  	add_column :profiles, :city, :string
  	add_column :profiles, :post_code, :string
  	add_column :profiles, :country, :string
    add_column :profiles, :state, :string
    add_column :profiles, :nationality, :string


  end
end
