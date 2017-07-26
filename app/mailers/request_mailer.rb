class RequestMailer < ApplicationMailer


	default from: "invitation@baffsup.com"


	def baffsup_occasion_friend_request(request, party,  visitor_url)



      @request = request

      @party = party

   
      @visitor_url = visitor_url(:id => @request.visitor.id, :party_id => @request.visitor.party.id )

      @url = 'https://secret-castle-41003.herokuapp.com'


      attachments.inline['baffup_6.png'] = File.read('./public/baffup_6.png')
     

      mail(to: @request.email)


    end

end

