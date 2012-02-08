require 'spec_helper'

describe 'Home page' do
  before do
    @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :description => 'Yummy street food')
  end

  it 'should show a recipe list title' do
    visit '/'
    page.should have_content 'My recipes'
  end

  it 'should show each recipe' do
    visit '/'
    page.should have_content @recipe.title
    page.should_not have_content 'Fish and chips'
  end
end
