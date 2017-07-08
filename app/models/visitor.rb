class Visitor < ApplicationRecord


     before_save :generate_token

	 acts_as_voter


	belongs_to :user
	
	#belongs_to :group

	belongs_to :party

	belongs_to :invite, optional: true


	belongs_to :request, optional: true
	
	has_many :comments
	# as: :commentable, dependent: :destroy

	#:visitor

	has_one :reservation

	has_many :notifications

	has_many :albums


	custom_slugs_with(:token)

	private

	def generate_token

      self.token = SecureRandom.hex(3)

    end
	
end
