class ProfilesController < ApplicationController



  layout 'te1profile'

  
   
    before_action :authenticate_user!

     def index

        @profile = current_user.profile


    end



       def show

        @profile = current_user.profile

       end

      	 def edit

            @profile = Profile.find(params[:id])

            
            
          end

           def edit_picture

            @profile ||= Profile.find(params[:id])
  
         end
          


          def update

           @profile = Profile.find(params[:id])

            if @profile.update_attributes(profile_params)
              flash[:notice] = "Profile updated successfully."
              redirect_to profiles_path
                    else

              render('edit')

            end

          end

    private

    def profile_params
     
         params.require(:profile).permit(:title, :name, :username, :age, :gender, :telephone, :hobbies, :image, :email, :user_id)

   end






 
end

