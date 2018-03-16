class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?

  BRAND_NAME = 'Baffsup'.freeze

  def meta_title(title)
    [title, BRAND_NAME].reject(&:empty?).join(' | ')
    
  end


   #helper_method :redirect_url

    protected

    def configure_permitted_parameters

        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :provider, :uid ) }
            
    end

    def after_sign_in_path_for(resource)

        return admin_root_path  if resource.class == AdminUser
        return profiles_path

    end


    def after_sign_up_path_for(resource)

        after_sign_in_path_for(resource)
          
    end
     
    def create_friend(user, buddy, invite) 
      

      @user = @party.user

        @friend  = @user.friends.build(user_id: @user.id, buddy_id: @invite.guest.id, invite_id: @invite.id, :pouch_id => @user.pouch.id)

        @friend.name = @invite.guest.name

        @friend.email = @invite.guest.email

        @friend.save

   end  

   def create_friend_other_way(friend, pouch, buddy, user, friend_notice) 

       Friend.create(:user_id => @friend_notice.friend.buddy.id, 
                     :pouch_id => @friend_notice.friend.buddy.pouch.id,
                     :buddy_id => @friend_notice.pouch.user.id,
                     :invite_id => 0,
                     :name => @friend_notice.pouch.user.name,
                     :email => @friend_notice.pouch.user.email)
    end  

    def redirect_url

      return new_user_session_path unless user_signed_in?

        case current_user

          when User

            profile_path(:id => current_user.profile.id)

          when Admin_User

            root_path

        end

     end


       def bad_slug?(object)
        params[:id] != object.to_param
      end

      ##
      # 301 redirect to canonical slug.
      def redirect_to_goodd_slug(object)
      
          redirect_to params.permit.merge({
                    :controller => controller_name,
                    :action => params[:action],
                    :id => object.to_param,
                    status: 301
                  })

      end
   def redirect_to_good_slug(object)
          redirect_to ({
                        
                        status: 301
                      })
      end

      # def badd_slug?(object)
     #   params[:party_id] != object.to_param
      #end

      ##
      # 301 redirect to canonical slug.
      #def redirect_to_goodd_slug(object)
      
       #   redirect_to params.permit.merge({
         #           :controller => controller_name,
       #             :action => params[:action],
                    
        #            status: 301
        #          })

      #end



  def confirm_logged_in
    unless session[:operator_id]
      flash[:notice] = "Please log in."
      redirect_to(access_login_path)
      # redirect_to prevents requested action from running
    end
  end
           
end
