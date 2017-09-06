class Profile < ApplicationRecord


include BaffupStepModel


	belongs_to :user


   		has_attached_file :image, 
	                   :styles => { large: "800x800", medium: "130x130>", thumb: "50x50>" }, default_url: "https://placehold.it/350x150.jpg&text=UPLOAD A PICTURE"

        validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

        custom_slugs_with(:name)

         def self.total_steps

            3

         end


       
end
