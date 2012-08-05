require 'spec_helper'

describe 'View recipes' do
  before do
    @aloo_chaat = Recipe.create!(:title => 'Aloo tikki chaat', :description => 'Yummy street food',
                             :ingredient_list => 'secret', :preparation_method => 'secret')
    @chole = Recipe.create!(:title => 'Chole', :description => 'My personal favourite',
                             :ingredient_list => 'secret', :preparation_method => 'secret')
  end

  it 'should show a list of recipes' do
    visit recipes_path
    page.should have_content @aloo_chaat.title
    page.should have_content @chole.title
  end

  it "should not show 'new recipe' link if user is not logged in" do
    visit recipes_path
    page.should_not have_link 'New recipe'
  end

  context "when logged in" do
    include_context :authentication

    it "should show 'new recipe' link if user is logged in" do
      visit recipes_path
      page.should have_link 'New recipe'
    end
  end
end
