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

    context 'with similar recipes' do
      before do
        @non_similar_recipe = Recipe.create!(:title => 'Pie and mash', :synopsis => 'Not so yummy street food', :description => 'This is...',
                                 :ingredient_list => 'secret sauce', :preparation_method => 'secret method', :category => 'non_vegetarian')
        @similar_recipe = Recipe.create!(:title => 'Pani poori', :synopsis => 'Yummy street food', :description => 'This is...',
                                 :ingredient_list => 'secret sauce', :preparation_method => 'secret method', :category => 'vegetarian')
        visit recipe_path(@recipe)
      end

      it "shows similar recipes box" do
        page.should have_content 'You might also like to try'
      end

      it "shows similar recipe link" do
        page.should have_link 'Pani poori', :href => recipe_path(@similar_recipe)
      end

      it "does no show non-similar recipe link" do
        page.should_not have_link 'Pie and mash'
      end
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
