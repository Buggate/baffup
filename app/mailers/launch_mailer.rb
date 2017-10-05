class LaunchMailer < ApplicationMailer


	default from: "Baffsup@baffsup.com"


    def baffsup_occasion(launch, operator, new_user_registration_url)

 

      @launch = launch


      @new_user_registration_url = new_user_registration_url


      @operator = operator
  

      @url = 'https://secret-castle-41003.herokuapp.com'
      
 
      attachments.inline['b_logo1.png'] = File.read('./public/b_logo1.png')

      attachments.inline['al-quran.jpg'] = File.read('./public/al-quran.jpg')

      attachments.inline['cathedral-mosque.jpeg'] = File.read('./public/cathedral-mosque.jpeg')


      mail(to: @launch.email)


    end


end
