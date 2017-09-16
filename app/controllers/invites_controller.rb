class InvitesController < ApplicationController

   before_action :authenticate_user!


   before_action :find_party

     # before_action :find_group

      attr_accessor :placeholder, :password, :password_confirmation

def create


  emails = params[:invite][:email].split(',')


   emails.each do |email|


    @invite = @party.invites.build(:party_id => @party.id, :host_id => @party.user_id, :email => email )

     @placeholder = "placeholder text"


   
   if  @invite.save && @invite.guest.present?


         create_visitor @invite, @party, @user

         create_notification @invite, @party, @visitor, @user
                  

         

         InviteMailer.baffsup_occasion_request(@invite, @party, visitor_url(:id => @invite.visitor.id, :party_id => @invite.party.id)).deliver_now


         create_friend @user, @buddy, @invite
               
         flash[:notice] = "Invitation Sent successfully."
                  

       else 
        
         InviteMailer.baffsup_occasion_invitation(@invite, @party, new_user_registration_url(:invite_token => @invite.token, :email => @invite.email, :password => @placeholder, :password_confirmation => @placeholder )).deliver_now

         flash[:notice] = "Invitation Sent successfully."

       end     
         
   
  end 
   
    redirect_to party_path(@party)
end 



 private

   def find_party

      if params[:party_id]
         @party = Party.find(params[:party_id])
      end
      
   end

   def create_visitor(user, party, invite)  
    
    @visitor = @party.visitors.build(party_id: @invite.party.id, name: @invite.guest.name, 
                                     user_id: @invite.guest.id, invite_id: @invite.id, 
                                     attend_party: @invite.party.date)

     @visitor.party_id = @visitor.party.id

    @visitor.save

  end  

  def create_notification(invite, party, visitor, user)  
    
       Notification.create(invite_id: invite.id,
                           party_id: invite.party.id,
                           visitor_id: invite.visitor.id,
                           user_id: invite.guest.id)
  end  


  def invite_params

         params.require(:invite).permit(:email, :token, :group_id, :host_id, :guest_id, :party_id)

  end


  def find_group
      if params[:group_id]
         @group = Group.find(params[:group_id])
      end
  end

  










  

end
