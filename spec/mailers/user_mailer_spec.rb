require "spec_helper"

describe UserMailer do
  describe '#welcome_email' do
    let(:subscription) { mock_model(Subscription, :name => 'Bob', :email => 'bob@roberts.com') }
    let(:mail) { UserMailer.welcome_email(subscription) }

    it 'renders the subject' do
      mail.subject.should == 'Welcome to Zanzaneet'
    end

    it 'renders the receiver email' do
      mail.to.should == [subscription.email]
    end

    it 'renders the sender email' do
      mail.from.should == ['info@zanzaneet.com']
    end

    it 'renders an unsubscribe link' do
      mail.body.should match subscription_path(subscription)
    end
  end

  describe '#newsletter' do
    let(:recipes) { [] }
    let(:posts) { [] }
    let(:subscription) { mock_model(Subscription, :name => 'Bob', :email => 'bob@roberts.com') }
    let(:mail) { UserMailer.newsletter(subscription, recipes, posts) }

    it 'renders the subject' do
      mail.subject.should == 'Zanzaneet News'
    end
  end
end
