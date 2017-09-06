class ProfilesController < ApplicationController



  layout 'te1profile'

  
   
    before_action :authenticate_user!

     def index

        @profile = current_user.profile


    end



       def show

        @profile = current_user.profile
        redirect_to_good_slug(@profile) and return if bad_slug?(@profile)

       end

      	 def edit

            @profile = Profile.find(params[:id])
            redirect_to_good_slug(@profile) and return if bad_slug?(@profile)

            
            
          end

           def edit_picture

            @profile ||= Profile.find(params[:id])
            redirect_to_good_slug(@profile) and return if bad_slug?(@profile)
  
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
     
    params.require(:profile).permit(:mobile, :address, :city, :post_code, :country, :state, :nationality, :work_place, :professional_skill,
     :position, :work_phone,:title, :name, :username, :age, :gender, :telephone, :hobbies, :image, :work_address, :email, :user_id)

  end


 
end

