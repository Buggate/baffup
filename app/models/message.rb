class Message

	#after_create :full_name


  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :email, :body
  validates :first_name, :last_name, :email, :body, presence: true


private

	def full_name
	  [self.first_name, self.last_name].compact.join(' ')
	end

	


end

