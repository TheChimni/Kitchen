require 'spec_helper'

describe 'Delete an existing recipe' do
  before do
    @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :description => 'Yummy street food',
                             :ingredient_list => 'secret', :preparation_method => 'secret')
  end

  context 'when not logged in' do
    it "'Destroy recipe' link should not be present" do
      visit recipe_path(@recipe)
      page.should_not have_link 'Delete this recipe'
    end

    it "should not let me destroy a recipe" do
      page.driver.submit :delete, recipe_path(@recipe), {}
      current_path.should == new_user_session_path
      Recipe.where(:id => @recipe.id).count == 1
    end
  end

  context 'when logged in' do
    include_context :authentication

    it 'I can destroy an existing recipe' do
      visit recipes_path
      click_link 'Read >>'
      current_path.should == recipe_path(@recipe)
      click_link 'Delete this recipe'
      current_path.should == recipes_path
      Recipe.where(:id => @recipe.id).count == 0
    end

  end

end

