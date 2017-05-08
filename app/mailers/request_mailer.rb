class RequestMailer < ApplicationMailer


	default from: "app65234427@heroku.com"


	def friend_request(request, party,  visitor_url)


      @request = request

      @party = party

   
      @visitor_url = visitor_url(:id => @request.visitor.id, :party_id => @request.visitor.party.id )

      @url = 'https://secret-castle-41003.herokuapp.com'


      attachments.inline['cool_logo3.jpg'] = File.read('./public/cool_logo3.jpg')
     

      mail(to: @request.email)


    end

end

