require 'spec_helper'

describe Subscription do

  it { should validate_presence_of :email }
  it { should_not validate_presence_of :name }
  it { should respond_to :name, :email, :created_at, :updated_at }

  context 'uniqueness constraints' do
    before { Subscription.create! :email => 'bob@example.com', :name => 'bob' }
    it { should validate_uniqueness_of :email }
  end

  # These specs are redundant as they've been tested using shoulda matcher above
  # context "When CREATING subscription" do

  #   it "should save the email address of the subscriber in the database" do
  #     subscriber = Subscription.create :name => 'bob', :email => 'bob@g.com'
  #     Subscription.count.should == 1
  #     subscriber.email.should == 'bob@g.com'
  #     subscriber.name.should == 'bob'
  #   end

  #   it "should NOT save when no email address is provided" do
  #     subscriber = Subscription.create :name => 'bob'
  #     Subscription.count.should == 0
  #     subscriber.name.should == 'bob'
  #   end

  #   it "should save when no name is provided" do
  #     subscriber = Subscription.create :email => 'bob@g.com'
  #     subscriber.email.should == 'bob@g.com'
  #     subscriber.name.should be_nil
  #     Subscription.count.should == 1
  #   end
  # end

  context "business logic validation when CREATING subscription" do
    before do
      @subscriber = Subscription.create! :name => 'rob', :email => 'rob@g.com'
    end

    it "should throw an exception when the same subscriber registers twice" do
      -> { subscriber = Subscription.create! :name => 'rob', :email => 'rob@g.com' }.should raise_error
    end
  end
end