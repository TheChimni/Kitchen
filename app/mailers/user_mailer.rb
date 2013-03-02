class UserMailer < ActionMailer::Base
  default from: "info@zanzaneet.com"

  def welcome_email(subscription)
    @subscription = subscription
    mail(:to => subscription.email, :subject => "Welcome to Zanzaneet")
  end
end
