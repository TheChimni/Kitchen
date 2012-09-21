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

      it "should create a new photo when I fill out the form and submit it"
    end
  end

  describe 'Managing and viewing photos within a recipe' do

    before do
      @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :synopsis => 'Yummy street food',
       :ingredient_list => 'secret', :preparation_method => 'secret')
      RecipePhoto.create!(:recipe => @recipe, :title => 'test1', :image => File.open('db/pictures/test.jpeg'))
      RecipePhoto.create!(:recipe => @recipe, :title => 'test2', :image => File.open('db/pictures/test.jpeg'))
      RecipePhoto.create!(:recipe => @recipe, :title => 'test3', :image => File.open('db/pictures/test.jpeg'))
    end

    describe "Viewing photos on the show page" do

      it 'should show the photos' do
        pending 'visit the show page for the recipe and check that the photos are displayed'
      end
    end

    describe "Managing photos on the edit page" do
      context 'when logged in' do
        include_context :authentication
        it 'should have a new photo link' do
          visit edit_recipe_path(@recipe)
          page.should have_link 'New Photo'
        end
        it 'should have edit links for each photo'
      end
    end

  end  
end