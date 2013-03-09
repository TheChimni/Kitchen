class UserMailer < ActionMailer::Base
  default from: "noreply@zanzaneet.com"

  def welcome_email(subscription)
    @subscription = subscription
    mail(:to => subscription.email, :subject => "Welcome to Zanzaneet")
  end

  def newsletter(subscription, recipes, posts)
    @subscription = subscription
    @recipes = recipes
    @posts = posts
    mail(:to => subscription.email, :subject => "Zanzaneet News")
  end
end
