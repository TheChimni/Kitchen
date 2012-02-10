require 'spec_helper'

describe 'Create a new recipe' do

  it 'should show a recipe list title' do
    visit '/'
    click_link 'New recipe'
    current_path.should == new_recipe_path
  end

end
