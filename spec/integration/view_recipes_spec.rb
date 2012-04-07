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
end
