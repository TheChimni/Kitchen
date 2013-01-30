require 'spec_helper'

describe 'Show an existing recipe' do

  context 'with proper desi food' do
    
    before do
      @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :synopsis => 'Yummy street food', :description => 'This is...',
                               :ingredient_list => 'secret sauce', :preparation_method => 'secret method', :category => 'vegetarian')
    end

    it "'Back to recipe' list should take you back to the recipe list page" do
      visit recipe_path(@recipe)
      click_on 'Back to recipe list'
      current_path.should == recipes_path
    end
  
    it "should show you the synopsis of the recipe" do
      visit recipe_path(@recipe)
      page.should have_content 'Yummy street food'
    end
  
    it "should show you the description of the recipe" do
      visit recipe_path(@recipe)
      page.should have_content 'This is...'
    end
  
    it "should show you the ingredients of the recipe" do
      visit recipe_path(@recipe)
      page.should have_content 'secret sauce'
    end
  
    it "should show you the preparation method of the recipe" do
      visit recipe_path(@recipe)
      page.should have_content 'secret method'
    end

    it "should show you the category of the recipe" do
      visit recipe_path(@recipe)
      page.should have_content 'Vegetarian'
    end

  end
  
  context 'Fish and chips' do
    before do
      @recipe = Recipe.create!(:title => 'Fish and chips', :synopsis => 'Not so Yummy street food',
                               :ingredient_list => 'greasy stuff', :preparation_method => 'toss into fryer')
    end
    
    it 'should show the synopsis of the recipe' do
      visit recipe_path(@recipe)
      page.should have_content 'Not so Yummy street food'
    end
  end

end
