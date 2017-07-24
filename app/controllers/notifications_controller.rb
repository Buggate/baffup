class NotificationsController < ApplicationController


before_action :authenticate_user!, except: [:index, :show]



  layout 'party_form'



	def link_through  

		@notification = Notification.find(params[:id])

		@notification.update read: true

	    redirect_to profiles_path @notification.guest.profile

    end 

	def index

		@visitor = Visitor.find_by_name(current_user.name)

	
	   @notifications = current_user.notifications

	  
	       
	end


	      

	     def show

			     @notification = Notification.find(params[:id])
	
        end


         private

          def notification_params

		    params.require(:notification).permit(:visitor_id, :user_id, :party_id, :invite_id, :name)

		  end


		  def find_visitor

		      if params[:visitor_id] 

		         @visitor = Visitor.find(params[:id])

		      end

		  end



          def find_title

			    @title = params[:title]

			      
		  end


end



