class DemoMailer < ApplicationMailer
  default from: "notification@dropque.com"
  #default from: "from@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.demo_mailer.request_demo.subject
  #
   def  request_demo(name, email, organization, message)
	    @name = name
	    @email = email
	    @organization = organization
	    @message = message
	   mail(to: "mustapha@dropque.com", subject: "New KaweDemo Request")
	 end

   def email_subscription(email)
      @mail = email
      mail(to: "mustapha@dropque.com", subject:"New Kawe Email Subscriber")
   end

end
