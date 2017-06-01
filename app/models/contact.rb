class Contact < MailForm::Base

  attribute :name, :validate => true

  attribute :email

  attribute :message, :validate => true

  attribute :nickname, :captcha => true

   def headers

      	{
          :subject =>  "Your Feedback is Valuable",
      	  :to => "kayurdesalawu@gmail.com",
      	  :from => %("#{name}" <#{email}>)

      	}

    end


end