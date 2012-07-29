require 'spec_helper'

describe HomeController do

  before do
    test_tweets = ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.']
    Twitter.stub(:user_timeline => test_tweets.collect { |tweet| stub(:text => tweet) })
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it "shows only 1 tweet" do
      get :index
      assigns(:tweets).should == ['I fancy chocolate pudding today.']
    end
  end

end