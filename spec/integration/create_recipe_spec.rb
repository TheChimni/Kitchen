require 'spec_helper'

describe 'Create a new recipe' do

  it 'should show a recipe list title' do
    visit '/'
    click_link 'New recipe'
    current_path.should == new_recipe_path
    fill_in 'Title', :with => 'Test recipe'
    fill_in 'Description', :with => 'Test description'
    fill_in 'Ingredients', :with => 'secret'
    fill_in 'Preparation method', :with => 'secret'
    click_button 'Save'
    Recipe.where(:title => 'Test recipe').count.should == 1
  end

end
