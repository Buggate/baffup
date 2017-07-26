class InviteMailer < ApplicationMailer


	default from: "invitation@baffsup.com"





    def baffsup_occasion_request(invite, visitor, party, visitor_url)


        @invite = invite

        @party = party

        @visitor = visitor

     
        @visitor_url = visitor_url(@visitor)

           
        @url = 'https://secret-castle-41003.herokuapp.com'

        attachments.inline['baffup_6.png'] = File.read('./public/baffup_6.png')
  
        mail(to: @invite.email)


    end

    def baffsup_occasion_invitation(invite, party, new_user_registration_url)

 

      @invite = invite


      @new_user_registration_url = new_user_registration_url


      @party = party
  

      @url = 'https://secret-castle-41003.herokuapp.com'
      
 
      attachments.inline['baffup_6.png'] = File.read('./public/baffup_6.png')


      mail(to: @invite.email)


    end


end


