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
        page.should have_field('Title')
        page.should have_field('Image')
      end
    end
  end

  describe 'Viewing the photos for a recipe' do

    before do
      @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :synopsis => 'Yummy street food',
       :ingredient_list => 'secret', :preparation_method => 'secret')
      RecipePhoto.create!(:recipe => recipe, :title => 'test1', :image => File.open('db/pictures/salmoncloseup1.jpg'))
      RecipePhoto.create!(:recipe => recipe, :title => 'test2', :image => File.open('db/pictures/dill1.jpg'))
      RecipePhoto.create!(:recipe => recipe, :title => 'test3', :image => File.open('db/pictures/test.jpeg'))
    end

    it 'should show the photos' do
    end

    context 'when logged in' do
      include_context :authentication
      it 'should have a new photo link' do
        visit recipe(@recipe)
        page.should have_link 'New'
      end
      it 'should have edit links for each photo'
    end

  end  
end