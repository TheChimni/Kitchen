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

  describe 'ingredients' do
    it 'extracts ingredients from a recipe' do
      recipe = Recipe.new
      recipe.ingredient_list = "2 kg *rice*"
      recipe.parse_ingredients.should == ['rice']
    end

    it 'extracts multiple ingredients' do
      recipe = Recipe.new
      recipe.ingredient_list = "Mix *dal* with *rice* and see if you can imagine *egg yolks* in it."
      pending
      recipe.parse_ingredients.should == ['dal', 'rice', 'egg yolks']
    end

    it "saves a new ingredient if it doesn't already exist" do
      recipe = Recipe.new :title => 'test dal', :description => 'try it' , :ingredient_list => '100gms of *masoor dal*',
        :preparation_method => 'test'
      recipe.save
      Ingredient.count.should == 1
    end

    it 'links an ingedient to a receipe if the ingredient in the recipe exists' do
      recipe = Recipe.new :title => 'test dal', :description => 'try it' , :ingredient_list => '100gms of *masoor dal*',
        :preparation_method => 'test'
      ingredient = Ingredient.create :title => 'masoor dal'
      recipe.save
      Ingredient.count.should == 1
      recipe.ingredients.count.should == 1
      recipe.ingredients.should include(ingredient)
    end
  end
end
