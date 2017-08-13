class RequestsController < ApplicationController


skip_before_action :verify_authenticity_token, only: [:create]


   before_action :authenticate_user!


   before_action :find_party

     # before_action :find_group

      #attr_accessor :placeholder, :password, :password_confirmation

 def index

 end


 #def new
   #@invite = @party.invites.build({:party_id => @party.id})
 #end 


def create

  emails = params[:request][:email]

   emails.each do |email|


    @request = @party.requests.build(:party_id => @party.id, :host_id => @party.user_id, :email => email )

   if  @request.save

       
       #create_visitor @request, @party, @friend

       #create_notification @request, @party, @visitor, @user
                
     

       RequestMailer.baffsup_occasion_friend_request(@request, @party, visitor_url(:id => @request.visitor.id, :party_id => @request.party.id)).deliver_now

      

       create_notification @request, @party, @visitor, @user

         flash[:notice] = "Request Sent successfully."



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



  def create_notification(request, party, visitor, user)  
    
       Notification.create(request_id: request.id,
                           party_id: request.party.id,
                           visitor_id: request.visitor.id,
                           user_id: request.visitor.user.id)
  end  



def create_visitor(friend, party, request)  
    
             @visitor = @party.visitors.build(party_id: @request.party.id, user_id: @request.friend.id, 
              request_id: @request.id, name: @request.party.friend.name, 
              attend_party: @request.party.date)

             @visitor.party_id = @visitor.party.id



              @visitor.save

 end



def request_params

         params.require(:request).permit(:email, :host_id, :friend_id, :party_id)

  end


  def find_group
      if params[:group_id]
         @group = Group.find(params[:group_id])
      end
  end
end

