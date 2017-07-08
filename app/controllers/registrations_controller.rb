class RegistrationsController < Devise::RegistrationsController


 def new

     build_resource({})

     @token = params[:invite_token]
     @email = params[:email]
     @password = params[:password]
     @password_confirmation = params[:password_confirmation]
 
   end



   def create

       @newUser = User.create(user_params)

       @token = params[:invite_token]


       if @newUser.save && @token != nil
        
          @invite = Invite.find_by_email(@newUser.email)

          @party = Invite.find_by_token(@token).party

           
          @invite.guest_id = @newUser.id 

          @invite.save 

          create_visitor @user, @party, @invite

          create_friend @user, @buddy, @invite

          redirect_to visitor_path(@visitor) if @visitor.party

          

              
      else


          @newUser = FormUser.find @newUser.id

          set_flash_message :notice, :signed_up if is_navigational_format?
          
          sign_in(@newUser)
          
          respond_with @newUser, :location => after_sign_up_path_for(@newUser)

      end  


    end


 private

    def user_params

      params.require(:user).permit(:name, :email, :password, :password_confirmation)

    end



    def create_notification(invite, group, visitor)  
        
        Notification.create(invite_id: @visitor.invite.id,
                            group_id: @visitor.group.id,
                            visitor_id: @visitor.id)
    end  


    def create_visitor(user, party, invite)  
        
        @visitor = @party.visitors.build(party_id: @invite.party.id, user_id: @invite.guest.id, invite_id: @invite.id)

        @visitor.party_id = @visitor.party.id

        @visitor.save

    end









end





