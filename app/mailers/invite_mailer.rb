class InviteMailer < ApplicationMailer


	default from: "app65234427@heroku.com"


    def existing_user_invite(invite, party, visitor_url)


        @invite = invite

        @party = party

     
        @visitor_url = visitor_url(:id => @invite.visitor.id, :party_id => @invite.visitor.party.id )

           
        @url = 'https://secret-castle-41003.herokuapp.com'

        attachments.inline['cool_logo3.jpg'] = File.read('./public/cool_logo3.jpg')
  


   

      


        mail(to: @invite.email)


    end

    def guest_invite(invite, party, new_user_registration_url)


      @invite = invite


      @new_user_registration_url = new_user_registration_url


      @party = party

      

      @url = 'https://secret-castle-41003.herokuapp.com'


     
        attachments.inline['cool_logo3.jpg'] = File.read('./public/cool_logo3.jpg')
    



      mail(to: @invite.email)


    end


end


