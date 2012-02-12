require 'spec_helper'

describe 'Delete an existing recipe' do

  before do
    @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :description => 'Yummy street food',
                             :ingredients => 'secret', :preparation_method => 'secret')
  end

  it 'should destroy an existing recipe' do
    visit recipes_path
    click_link 'Aloo tikki chaat'
    current_path.should == recipe_path(@recipe)
    click_link 'Delete this recipe'
    current_path.should == recipes_path
    Recipe.where(:id => @recipe.id).count == 0
  end

end

