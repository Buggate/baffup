class Party < ApplicationRecord

  include BaffupStepModel


	belongs_to :user

	has_many :catalogues

	# has_many :groups
	has_many :visitors

	has_many :requests

	has_many :invites

	has_many :comments

	has_many :notifications

	has_many :albums

	has_many :reservations

	has_many :photos

	scope :sorted, lambda { order("parties.created_at DESC")}

    validates :category, presence: true, if: :step1?

    validates :title, presence: true, if: :step2?

    validates :venue, presence: true, if: :step3?

    


	has_attached_file :picture, 
	                    :styles => { thumb: "80x80", medium: "300x300", large: "640x640" }, default_url: "https://placehold.it/350x150.jpg&text=PLACE PICTURE example - I. V CARD "
    

    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

    

    
    
     custom_slugs_with(:title)

   def self.total_steps

      3

   end

end