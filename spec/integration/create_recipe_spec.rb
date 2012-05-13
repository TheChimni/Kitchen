require 'spec_helper'

describe 'Create a new recipe' do
  include_context :authentication

  it 'should create a new recipe when all the required fields are specified' do
    visit recipes_path
    click_link 'New recipe'
    current_path.should == new_recipe_path
    fill_in 'Title', :with => 'Test recipe'
    fill_in 'Description', :with => 'Test description'
    fill_in 'Ingredients', :with => 'secret'
    fill_in 'Preparation method', :with => 'secret'
    click_button 'Save'
    Recipe.where(:title => 'Test recipe').count.should == 1
  end

  it 'should display the form again with an error message when the description is not specified' do
    visit recipes_path
    click_link 'New recipe'
    current_path.should == new_recipe_path
    fill_in 'Title', :with => 'Test recipe'
    fill_in 'Ingredients', :with => 'secret'
    fill_in 'Preparation method', :with => 'secret'
    click_button 'Save'
    Recipe.where(:title => 'Test recipe').count.should == 0
    page.should have_content "Description can't be blank"
  end

  it 'should not create a new recipe when we press Cancel button' do
    visit recipes_path
    click_link 'New recipe'
    current_path.should == new_recipe_path
    fill_in 'Title', :with => 'Test recipe'
    fill_in 'Description', :with => 'Test description'
    fill_in 'Ingredients', :with => 'secret'
    fill_in 'Preparation method', :with => 'secret'
    click_link 'Cancel'
    Recipe.where(:title => 'Test recipe').count.should == 0
    current_path.should == recipes_path
  end
end
