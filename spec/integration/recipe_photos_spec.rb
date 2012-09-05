require 'spec_helper'

describe 'Recipe photos' do

  describe 'Creating a new photo' do

    before do
      @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :synopsis => 'Yummy street food',
       :ingredient_list => 'secret', :preparation_method => 'secret')
    end

    context 'when not logged in' do
      it "should not be able to visit the new recipe photo form" do
        visit new_recipe_recipe_photo_path(@recipe)
        current_path.should == new_user_session_path
      end
    end

    context 'when user is logged in' do
      include_context :authentication

      it "should display the new photo form" do
        visit new_recipe_recipe_photo_path(@recipe)
        current_path.should == new_recipe_recipe_photo_path(@recipe)
        # Assert that the form is displayed
      end
    end
  end

  describe 'Viewing the photos for a recipe' do

    before do
      @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :synopsis => 'Yummy street food',
       :ingredient_list => 'secret', :preparation_method => 'secret')
      # Also create 3 new photos (see the seeds.rb)
    end

    it 'should show the photos'

    context 'when logged in' do
      it 'should have a new photo link'
      it 'should have edit links for each photo'
    end

  end  
end