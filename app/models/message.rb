class Message


  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :email, :body
  validates :first_name, :last_name, :email, :body, presence: true


end

