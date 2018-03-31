class FriendMailer < ApplicationMailer

	default from: "Baffsup<notify@baffsup.com>"



    def baffsup_friend_request(friend, pouch, edit_pouch_friend_url)


        @friend = friend

        @pouch = pouch

        @profile = @pouch.user.profile

       @edit_pouch_friend_url = edit_pouch_friend_url

           
        @url = 'https://secret-castle-41003.herokuapp.com'

        attachments.inline['b_logo1.png'] = File.read('./public/b_logo1.png')


        mail to: "#{@friend.name}<#{@friend.email}>"


    end

end