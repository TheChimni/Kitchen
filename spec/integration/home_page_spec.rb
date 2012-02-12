require 'spec_helper'

describe 'Home page' do
  before do
    @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :description => 'Yummy street food',
                             :ingredients => 'secret', :preparation_method => 'secret')
  end

  it 'should show a recipe list title' do
    visit '/'
    page.should have_content "Rieethaa's Kitchen"
  end

end
