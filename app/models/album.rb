class Album < ApplicationRecord




#scope :visible, lambda { where(:visible => true) }
 # scope :invisible, lambda { where(:visible => false) }
  #scope :sorted, lambda { order("albums.position ASC") }
 #scope :newest_first, lambda { order("albums.created_at DESC")}

  
    acts_as_votable

	# belongs_to :profile

	belongs_to :visitor, optional: true

	belongs_to :party, optional: true

#	has_many :notifications








	has_attached_file :picture, 

	                 :styles => { thumb: "80x80", medium: "300x300", large: "800x800" }, default_url: "/images/:style/AddGist.png"

   

    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

    validates_attachment_presence :picture

    




    #validates_attachment :image,
     #                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }



end
