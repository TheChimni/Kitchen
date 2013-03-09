require 'spec_helper'

describe 'Unsubscribe' do
  before do
    # Stubbing the external twitter API
    @tweets = ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.']
    Twitter.stub(:user_timeline => @tweets.collect { |tweet| stub(:text => tweet) })
  end

  context "when visiting the unsubscribe page with a valid token" do

    let(:subscription) { Subscription.create(:name => 'Bob', :email => 'bob@roberts.com') }

    before do
      visit subscription_path(subscription)
    end

    it 'opens the show page' do
      current_path.should == subscription_path(subscription)
    end

    it 'clicking the Unsubscribe buttons deletes the subscription' do
      click_button 'Unsubscribe'
      Subscription.where(:id => subscription.id).count.should == 0
    end

  end

  context "when visiting the unsubscribe page with an invalid token" do
    it 'does not permit me to delete a subscription without a valid token'
  end

end

