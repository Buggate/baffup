class FriendsController < ApplicationController


	before_action :find_pouch


   def index


   	@friends = @pouch.friends

   end


   def show

   	@friend = Friend.find(params[:id])

   	

   end



  def create

   
    @friend = @pouch.friends.build(friend_params)

   if  @friend.save!

         
         FriendMailer.baffsup_pouch_friend(@friend, @pouch, edit_pouch_friend_url(:id => @friend.id, :pouch_id => @pouch.id)).deliver_now
         
         create_friend_notice @friend, @pouch, @user, @buddy
         
         flash[:notice] = "Invitation Sent successfully."


     end     

   
    redirect_to profiles_path

  end 


def edit
	@pouch = Pouch.find(params[:pouch_id]) 

     @friend = Friend.find(params[:id])        
  
 end
          
def update

	@pouch = Pouch.find(params[:pouch_id]) 

   @friend = Friend.find(params[:id])

       if @friend.update_attributes(friend_params)

         flash[:notice] = "Profile updated successfully."

         redirect_to profile_path(@friend.buddy.profile)

       else

           render('edit')

        end

  end


	
  def delete



    @friend = Friend.find(params[:id])

  end

  def destroy
    
    @pouch = Pouch.find(params[:pouch_id]) 
    friend = Friend.find(params[:id])
    friend.destroy
    flash[:notice] = "Friend Record '#{friend.name}' destroyed successfully."

    redirect_to profiles_path

  end 

 private


   def find_pouch

      if params[:pouch_id]

         @pouch = Pouch.find(params[:pouch_id])

      end
      
   end

   
  def friend_params

         params.require(:friend).permit(:email, :name, :buddy_id, :user_id, :pouch_id, :invite_id)

  end

 


    def create_friend_notice(friend, pouch, buddy, user)  
    
       @friend_notice = FriendNotice.new(friend_id: @friend.id,
                    pouch_id: @pouch.id,
                    buddy_id: @friend.buddy.id,
                    user_id: @pouch.user.id)

        if @friend_notice.save!

        	

        	Friend.create(:user_id => @friend.buddy.id, 
                     :pouch_id => @friend.buddy.pouch.id,
                     :buddy_id => @pouch.user.id,
                     :invite_id => 0,
                     :name => @pouch.user.name,
                     :email => @pouch.user.email)



       end 


     end 



	
end
