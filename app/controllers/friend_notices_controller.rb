class FriendNoticesController < ApplicationController

	before_action :authenticate_user!


	def index
	    @friend_notices = friend_notice.where(buddy_id: current_user.id).recent
	end



		def edit
			
		 end
		          
		def update

			@friend_notice = FriendNotice.find(params[:id]) 

		       if @friend_notice.update_attributes(friend_notice_params)

		         flash[:notice] = "friend_notice updated successfully."

		         redirect_to edit_pouch_friend_path(:id => @friend_notice.friend_id, :pouch_id => @friend_notice.user.pouch.id)


		       else

		           render('edit')

		        end

		  end


		    def delete



		    @friend_notice = FriendNotice.find(params[:id]) 

		  end

		  def destroy
		    
		    friend_notice = FriendNotice.find(params[:id]) 
		    friend_notice.destroy
		    flash[:notice] = "Friend Request '#{friend_notice}' destroyed successfully."

		    redirect_to profiles_path

		  end 


			private

			def friend_notice_params

		         params.require(:friend_notice).permit(:friend_id, :action, :buddy_id, :user_id, :pouch_id, :read_at)

		  end

end
