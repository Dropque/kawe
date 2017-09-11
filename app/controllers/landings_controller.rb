class LandingsController < ApplicationController
  layout 'landing'
  def index
  end

  def subscribe
    sub = Subscription.new(create_sub_params)
    if sub.save
      render text: "true"
    else
      render text: "false"
    end
  end

  def request_demo
    demo = Demo.new(create_request_params)
    puts "******************one"
    if demo.save

      # send to our slack channel
      if Rails.env.production?
        notifier = Slack::Notifier.new "https://hooks.slack.com/services/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", channel: '#notification', username: 'requestDemo'
        notifier.ping "New Request Demo by " + params[:name] + "\n" +
                      "email: " + params[:email] + "\n" +
                      "at organization(" + params[:organization] + ")\n" +
                      "want to use dropque for " + params[:message] + "\n" +
                      "One of us should kindly reach out. Thanks Kawe Bot"
      end

      # send to our notificationgroup@dropque.com general mail
      # parameter is as follows, name, email, organization, role, purpose
      #DemoMailer.request_demo(params[:name], params[:email], params[:organization], params[:message]).deliver

      render text: "received"
    else

      render text: "rejected"
    end
  end
def create_request_params
    params.permit(:name,  :email, :organization, :message)
end

def create_sub_params
    params.permit(:email)
end




end
