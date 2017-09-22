class Invite < ApplicationRecord


  before_save :generate_token

    # after_create :new_user

   before_create :check_user_existence

    #belongs_to :group

    belongs_to :party
    belongs_to :host, :class_name => 'User', optional: true
    belongs_to :guest, :class_name => 'User', optional: true

    has_many :friends

   
    has_one :visitor

    has_many :notifications



 private

  def generate_token

      self.token = Digest::SHA1.hexdigest([self.party_id, Time.now, rand].join)

  end

 def check_user_existence

    @user ||= User.find_by_email(self.email)

   if @user

     self.guest_id = @user.id
     
   end

 end




end



