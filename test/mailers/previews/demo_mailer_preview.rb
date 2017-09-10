# Preview all emails at http://localhost:3000/rails/mailers/demo_mailer
class DemoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/demo_mailer/request_demo
  def request_demo
    DemoMailer.request_demo
  end

end
