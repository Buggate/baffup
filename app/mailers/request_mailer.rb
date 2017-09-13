class RequestMailer < ApplicationMailer


	default from: "Baffsup_Invitation@baffsup.com"


	def baffsup_occasion_friend_request(request, party, visitor_url)



      @request = request

      @party = party

      @visitor = @request.visitor

   
      @visitor_url = visitor_url(@visitor)

      @url = 'https://secret-castle-41003.herokuapp.com'


      attachments.inline['baffup_6.png'] = File.read('./public/baffup_6.png')
     

      mail(to: @request.email)


    end

end



