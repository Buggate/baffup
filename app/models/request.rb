class Request < ApplicationRecord

    after_create :create_visitor

    belongs_to :party
    belongs_to :host, :class_name => 'User', optional: true

     belongs_to :friend, :class_name => 'User', optional: true

   
    has_one :visitor

    has_many :notifications



 private

def create_visitor
   
   @email = self.email

   @user = User.find_by_email(@email)

   @party = self.party

   @visitor = @party.visitors.build(party_id: self.party.id, user_id: @user.id, request_id: self.id)

     @visitor.party_id = @visitor.party.id

     @visitor.name = @visitor.user.name

     @visitor.attend_party = @visitor.party.date

    @visitor.save


 end


end
