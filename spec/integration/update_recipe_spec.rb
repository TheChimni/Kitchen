require 'spec_helper'

describe 'Update an existing recipe' do

  before do
    @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :synopsis => 'Yummy street food',
                             :ingredient_list => 'secret', :preparation_method => 'secret')
  end

  context 'when not logged in' do
    it "'Edit this recipe' link should not be present" do
      visit recipe_path(@recipe)
      page.should_not have_link 'Edit this recipe'
    end
  end

  context 'when logged in' do
    include_context :authentication

    it 'should update the properties of an existing recipe' do
      visit recipes_path
      click_link 'Read >>'
      current_path.should == recipe_path(@recipe)
      click_link 'Edit this recipe'
      current_path.should == edit_recipe_path(@recipe)
      fill_in 'Synopsis', :with => 'new synopsis'
      click_button 'Update'
      @recipe.reload
      @recipe.synopsis.should == 'new synopsis'
      current_path.should == recipe_path(@recipe)
    end

    it 'should not update the properties of an existing recipe when I press the Cancel button' do 
      visit recipes_path
      click_link 'Read >>'
      current_path.should == recipe_path(@recipe)
      click_link 'Edit this recipe'
      current_path.should == edit_recipe_path(@recipe)
      fill_in 'Synopsis', :with => 'new synopsis'
      click_link 'Cancel'
      @recipe.reload
      @recipe.synopsis.should == 'Yummy street food'
      current_path.should == recipe_path(@recipe)
    end
  end

end
