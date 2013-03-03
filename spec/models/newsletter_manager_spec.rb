require 'spec_helper'

describe NewsletterManager do
  let(:subscriptions) { [mock_model(Subscription, :name => 'Bob', :email => 'bob@roberts.com'),
                         mock_model(Subscription, :name => 'Jim', :email => 'jim@james.com')] }
  let(:recipes) { stub('Recipes') }
  let(:posts) { [] }
  let(:mail) { stub('Mail', :deliver => nil) }

  it 'calls the mailer with each subscription', :focus do
    UserMailer.should_receive(:newsletter).with(subscriptions[0], recipes, posts) { mail }
    UserMailer.should_receive(:newsletter).with(subscriptions[1], recipes, posts) { mail }
    Subscription.stub(:all) { subscriptions }
    Recipe.stub(:where) { recipes }
    subject.create_and_send
  end
end
