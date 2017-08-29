class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject



 
  #

  first_name = message.first_name

  last_name = message.last_name


  def contact_me(message)

  	first_name = message.first_name

    last_name = message.last_name

    full_name = "#{first_name} - $#{last_name}"

    @body = message.body

    mail to: "kayurdesalawu@gmail.com", from: message.full_name

  end
  
end
