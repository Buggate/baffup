class Profile < ApplicationRecord

before_save do 

  self.social_network_group.gsub!(/[\[\]\"]/, "") if attribute_present?("social_network_group")

end


	    belongs_to :user


   		has_attached_file :image, 
	                   :styles => {:original => {}}, default_url: "https://placehold.it/350x150.jpg&text=UPLOAD A PICTURE"

        validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

        has_attached_file :header_photo, 
	                   :styles => {:original => {}}, default_url: "https://placehold.it/350x150.jpg&text=UPLOAD A PICTURE"

        validates_attachment_content_type :header_photo, content_type: /\Aimage\/.*\z/

        custom_slugs_with(:name)

       
end


	

