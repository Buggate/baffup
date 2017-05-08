class OmniauthCallbacksController < Devise::OmniauthCallbacksController


 # before_action :yahoo_callback, only: [:yahoo_oauth2]
        def all
           
           @user = User.from_omniauth(request.env["omniauth.auth"])

               if @user.persisted?

                @user.update_attribute( :uid, @user.uid)

                @user = FormUser.find @user.id
                

                sign_in_and_redirect @user, event: :authentication

                flash[:notice] = "Welcome on board."

               else
                 
                 session["devise.#{provider}_data"] = env["omniauth.auth"]
                 redirect_to new_user_registration_url

               end
           

      end


                alias_method :facebook, :all
                alias_method :twitter, :all
                alias_method :google_oauth2, :all
                alias_method :yahoo_oauth2, :all
                


   
        


      private


       def yahoo_callback(yahoo_oauth2=nil)

            yahoo_oauth2 = OAuth2.callback 
            yahoo_oauth2 = request.env['omniauth.auth']
            access_token = auth.credentials.token
            refresh_token = auth.credentials.refresh_token
            expires_at = auth.credentials.expires_at

        end

     

      #private

      #def yahooOauth2

       # auth_info = request.env['omniauth.auth']
       # access_token = auth_info[:credentials][:token]
       # refresh_token = auth_info[:credentials][:refresh_token]
       # expires_at = auth_info[:credentials][:expires_at]
      

      # end

end