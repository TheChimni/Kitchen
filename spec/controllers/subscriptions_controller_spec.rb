require 'spec_helper'

describe SubscriptionsController do
  before do
  end

  describe "POST 'create'" do
    it "redirects to '/' and sets notice on successful save" do
      #Subscription.any_instance.stub(:save => true)
      Subscription.stub(:new) { mock_model(Subscription, :save => true) }
      post :create, :subscription => { :name =>  "", :email => "bob@roberts.com" }
      # flash[:notice].inspect
      response.should redirect_to("#{root_path}#contact")
      flash[:notice].should == 'Thankyou, your subscription has been created'
    end

    it "redirects to '/' and sets error on unsuccessful save" do
      Subscription.stub(:new) { mock_model(Subscription, :save => false) }
      post :create, :subscription => { :name =>  "", :email => "bob@roberts.com" }
      response.should redirect_to("#{root_path}#contact")
      flash[:error].should match(/Your subscription could not be created/)
    end
  end

  describe "POST 'create' with Ajax" do
    it "returns success on successful save" do
      Subscription.stub(:new) { mock_model(Subscription, :save => true) }
      xhr :post, :create, :subscription => { :name =>  "", :email => "bob@roberts.com" }
      response.should be_success
      subscription = assigns[:subscription]
      subscription.should_not be_nil
      subscription.name.should be_blank
      subscription.email.should be_blank
    end

    it "returns failure on unsuccessful save", :focus do
      Subscription.stub(:new) do |params|
        params[:save] = false
        mock_model(Subscription, params)
      end
        # is equivalent to...
        # model = mock_model(Subscription)
        # params.each do |key, value|
        #   model.stub(key).and_return(value)
        # end
        # # or...
        # model.stub(:name).and_return('')
        # model.stub(:email).and_return('')
        # model.stub(:save).and_return(save)
        # model(Subscription, params)
        # model
      xhr :post, :create, :subscription => { :name =>  "", :email => "bob@roberts.com" }
      response.should be_success
      subscription = assigns[:subscription]
      subscription.should_not be_nil
      subscription.name.should be_blank
      subscription.email.should == 'bob@roberts.com'
    end
  end
end
