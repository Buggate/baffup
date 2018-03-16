class FriendMailer < ApplicationMailer

	default from: "Baffsup_Invitation@baffsup.com"



    def baffsup_pouch_friend(friend, pouch, edit_pouch_friend_url)


        @friend = friend

        @pouch = pouch

        @profile = @pouch.user.profile

       @edit_pouch_friend_url = edit_pouch_friend_url

           
        @url = 'https://secret-castle-41003.herokuapp.com'

  
        mail(to: @friend.email)


    end

end