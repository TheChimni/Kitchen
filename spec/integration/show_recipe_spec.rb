require 'spec_helper'

describe 'Show an existing recipe' do

  before do
    @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :description => 'Yummy street food',
                             :ingredients => 'secret', :preparation_method => 'secret')
  end

  it "'Back to recipe' list should take you back to the recipe list page" do
    visit recipe_path(@recipe)
    click_on 'Back to recipe list'
    current_path.should == recipes_path
  end
  
  it "should show you the description of recipe" do
    pending
    visit recipe_path(@recipe)
    page.should have_content 'Yummy street food'
  end
  

end