class Profile < ApplicationRecord


	belongs_to :user


   		has_attached_file :image, 
	                   :styles => {:original => {}}, default_url: "https://placehold.it/350x150.jpg&text=UPLOAD A PICTURE"

        validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

        custom_slugs_with(:name)

      

       
end
