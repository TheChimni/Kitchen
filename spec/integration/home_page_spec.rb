require 'spec_helper'


describe 'Home page' do
  before do
    # Stubbing the external twitter API
    @tweets = ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.']
    Twitter.stub(:user_timeline => @tweets.collect { |tweet| stub(:text => tweet) })
  end

  context "with a recipe" do
    before do
      @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :description => 'Yummy street food',
       :ingredient_list => 'secret', :preparation_method => 'secret')
    end

    it 'should show a page header' do
      visit '/'
      page.should have_content "Kitchen Sanskriti"
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
      page.should have_content @recipe.description
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
  end
end
