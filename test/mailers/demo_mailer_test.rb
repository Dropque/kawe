require 'test_helper'

class DemoMailerTest < ActionMailer::TestCase
  test "request_demo" do
    mail = DemoMailer.request_demo
    assert_equal "Request demo", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
