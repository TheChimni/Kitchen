require 'spec_helper'

describe Recipe do
  it 'should have a nil title by default' do
    recipe = Recipe.new
    recipe.title.should be_nil
    # The previous line is equivalent to 
    # recipe.title.nil?.should == true
  end

  it 'should allow me to set a title' do
    recipe = Recipe.new(:title => 'Tasty recipe')
    recipe.title.should_not be_nil
    recipe.title.should == 'Tasty recipe'
  end

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :ingredient_list }
  it { should validate_presence_of :preparation_method }

  it { should have_attached_file :picture }
  it { should have_and_belong_to_many :ingredients }
end
