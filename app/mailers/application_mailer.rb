class ApplicationMailer < ActionMailer::Base

  queue_as :default	
  default from: "invitation@baffsup.com"
  layout 'mailer'
  
end



