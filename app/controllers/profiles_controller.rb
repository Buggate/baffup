class ProfilesController < ApplicationController

     layout :resolve_layout

    before_action :authenticate_user!

    def index

        @profile = current_user.profile

        @pouch = @profile.user.pouch

        @notifications = @profile.user.notifications
       
        @visitors = @profile.user.visitors

       @friend_notices = FriendNotice.all.where(:buddy_id => @profile.user)

      if params[:q].present?

           @q = Profile.ransack(params[:q])
           @profiles = @q.result(distinct: true)

           @profiles = @profiles.paginate(page: params[:profile_page], per_page: 9)

      else
           @q = Profile.ransack(params[:q])
           @profiles = @q.result(distinct: true)

      end

   end

    def show

      @profile = Profile.find(params[:id])
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
     
       params.require(:profile).permit(:title, :name, :username, :age, :email, :school_email, :work_email, :gender, :telephone, :hobbies, :mobile,
                                    :country, :work_place, :professional_skill, :work_phone, :image, :header_photo,
                                    :address_line_1, :address_line_2, :address_city, :address_lga, :address_state, :nationality, 
                                    :school, :work_address_line_1, :work_address_line_2, :work_address_city, :work_address_lga,
                                    :work_address_state, :course, :user_id, social_network_group:[])


  end



 def resolve_layout

    case action_name

    when  "edit_picture", "edit"

      "party_form"

    when "show"

       "pro_show"

    else

      "te1profile"

    end

 end

 
end

