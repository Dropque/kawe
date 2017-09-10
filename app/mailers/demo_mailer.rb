class DemoMailer < ApplicationMailer

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
	   mail(to: "notificationgroup@dropque.com", subject: "New KaweDemo Request")
	end


  #def request_demo
   # @greeting = "Hi"
   # mail to: "to@example.org"
 # end
end
