class LaunchMailer < ApplicationMailer


	default from: "Baffsup@baffsup.com"


    def baffsup_ready(launch, operator, new_user_registration_url)

 

      @launch = launch


      @new_user_registration_url = new_user_registration_url


      @operator = operator
  

      @url = 'https://secret-castle-41003.herokuapp.com'
      
 
      attachments.inline['b_logo1.png'] = File.read('./public/b_logo1.png')


      mail(to: @launch.email)


    end


end
