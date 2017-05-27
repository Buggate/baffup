class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?


   #helper_method :redirect_url

    protected

        def configure_permitted_parameters

            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :provider, :uid ) }
            
        end


        def after_sign_in_path_for(resource_or_scope)

         profiles_path(:profile_id => current_user.profile.id)

        end


        def after_sign_up_path_for(resource)

          after_sign_in_path_for(resource)
          
        end

          
    def create_friend(user, buddy, invite) 

        current_user = @party.user
        
        @friend  = current_user.friends.build(user_id: current_user.id, buddy_id: @invite.guest.id, invite_id: @invite.id)

        @friend.name = @invite.guest.name

        @friend.email = @invite.guest.email

        @friend.save

      end  


    def redirect_url

      return new_user_session_path unless user_signed_in?

        case current_user

          when User

            profiles_path(:profile_id => current_user.profile.id)

          when Admin_User

            root_path

        end

     end


       def bad_slug?(object)
        params[:id] != object.to_param
      end

      ##
      # 301 redirect to canonical slug.
      def redirect_to_good_slug(object)
      
          redirect_to params.permit.merge({
                    :controller => controller_name,
                    :action => params[:action],
                    :id => object.to_param,
                    status: 301
                  })

      end


       def badd_slug?(object)
        params[:party_id] != object.to_param
      end

      ##
      # 301 redirect to canonical slug.
      def redirect_to_goodd_slug(object)
      
          redirect_to params.permit.merge({
                    :controller => controller_name,
                    :action => params[:action],
                    
                    status: 301
                  })

      end
           
end

