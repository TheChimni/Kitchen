require 'spec_helper'

describe 'Home page' do
  before do
    @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :description => 'Yummy street food',
                             :ingredients => 'secret', :preparation_method => 'secret')
  end

  it 'should show a page header' do
    visit '/'
    page.should have_content "My Rustic Kitchen"
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

end
