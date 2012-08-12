require 'spec_helper'


describe 'Home page' do
  before do
    # Stubbing the external twitter API
    @tweets = ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.']
    Twitter.stub(:user_timeline => @tweets.collect { |tweet| stub(:text => tweet) })
  end

  context "with a recipe" do
    before do
      @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :synopsis => 'Yummy street food',
       :ingredient_list => 'secret', :preparation_method => 'secret')
    end

    it 'should show a page header' do
      visit '/'
      page.should have_content "Zanzaneet"
    end

    it "should have a link to the home page" do
      visit '/'
      page.should have_link 'Home'
      click_link 'Home'
      current_path.should == root_path
    end

    it "should have a link to the recipes list" do
      visit '/'
      page.should have_link 'Recipes'
      click_link 'Recipes'
      current_path.should == recipes_path
    end

    it "should have recipes" do
      visit '/'
      page.should have_content @recipe.title
      page.should have_content @recipe.synopsis
    end

    it 'should have a link to the recipe show page' do
      visit '/'
      pending
    # Find the link 'tell me more'
    # click
    # verify that it takes you to the recipe show page
    end
  end

  it "should have last 1 tweet" do
    visit '/'
    # @tweets[0..2].each { |tweet| page.should have_content tweet }
    page.should have_content @tweets[0]
    page.should_not have_content @tweets[1]
  end

  context "contact us section" do
    it "should show subscription form with name field" do
      visit '/'
      page.should have_field 'Name'
      # page.has_field?('Name').should be_true
    end

    it "should show subscription form with name field" do
      visit '/'
      page.should have_field 'Email'
    end

    it "should save a valid subscription" do
      visit '/'
      fill_in 'Email', :with => 'puppy@woof.com'
      click_button 'Subscribe'
      page.current_path.should == root_path
      Subscription.count.should == 1
      page.should have_content 'Thankyou, your subscription has been created'
    end

    it "should not save an invalid subscription and throw error" do
      visit '/'
      fill_in 'Email', :with => 'puppy'
      click_button 'Subscribe'
      page.current_path.should == root_path
      Subscription.count.should == 0
      page.should have_content 'Your subscription could not be created'
    end
  end
end
