class NotificationsController < ApplicationController



before_action :find_visitor


before_action :authenticate_user!, except: [:index, :show]



    def show

       @notification = Notification.find(params[:id])
	
    end


    def edit

       @notification = Notification.find(params[:id]) 
     @visitor = @notification.visitor

    		
    end
          
    def update

	   @notification = Notification.find(params[:id]) 
	   
         @visitor = @notification.visitor

         if @notification.update_attributes(notification_params)

           flash[:notice] = "Notification updated successfully."

           redirect_to visitor_path(@visitor)


        else

           render('edit')

        end

  end


    def delete



    @notification = Notification.find(params[:id])

  end

  def destroy
    
    @visitor = Visitor.find(params[:visitor_id]) 
    notification = Notification.find(params[:id])
    notification.destroy
    flash[:notice] = "Friend Record '#{notification.visitor.name}' destroyed successfully."

    redirect_to profiles_path

  end 


    private

          def notification_params

		    params.require(:notification).permit(:visitor_id, :user_id, :party_id, :invite_id, :name, :read)

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
