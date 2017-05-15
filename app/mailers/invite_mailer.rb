class InviteMailer < ApplicationMailer


	default from: "Baffsup"


    def existing_user_invite(invite, party, visitor_url)


        @invite = invite

        @party = party

     
        @visitor_url = visitor_url(:id => @invite.visitor.id, :party_id => @invite.visitor.party.id )

           
        @url = 'https://secret-castle-41003.herokuapp.com'

        attachments.inline['logo_one.png'] = File.read('./public/logo_one.png')
  


   

      


        mail(to: @invite.email)


    end

    def guest_invite(invite, party, new_user_registration_url)


      @invite = invite


      @new_user_registration_url = new_user_registration_url


      @party = party

      

      @url = 'https://secret-castle-41003.herokuapp.com'


     
        attachments.inline['logo_one.png'] = File.read('./public/logo_one.png')
    



      mail(to: @invite.email)


    end


end


