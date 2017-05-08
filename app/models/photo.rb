class Photo < ApplicationRecord

	belongs_to :party, optional: true

	has_attached_file :image, 

	                 :styles => { thumb: "80x80", medium: "300x300", large: "800x800" }, default_url: ""

   
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
