# need to set up a spec and then assert like this...
#       assigns(:tweets).should == [...
require 'spec_helper'

describe HomeController do

  before do
    @tweets = ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.', 'I am hungry!', 'I am not feeling well!']
    Twitter.stub(:user_timeline => @tweets.collect { |tweet| stub(:text => tweet) })
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "shows 3 tweets only" do
      get 'index'
      assigns(:tweets).should == ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.', 'I am hungry!']
    end
  end

end