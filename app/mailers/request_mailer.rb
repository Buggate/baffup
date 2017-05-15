class RequestMailer < ApplicationMailer


	default from: "Baffsup"


	def friend_request(request, party,  visitor_url)


      @request = request

      @party = party

   
      @visitor_url = visitor_url(:id => @request.visitor.id, :party_id => @request.visitor.party.id )

      @url = 'https://secret-castle-41003.herokuapp.com'


      attachments.inline['logo_one.png'] = File.read('./public/logo_one.png')
     

      mail(to: @request.email)


    end

end

