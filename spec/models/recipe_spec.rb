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
      recipe.parse_ingredients.should == ['dal', 'rice', 'egg yolks']
    end

  context "when CREATING recipe" do
    # create
    it "saves a new ingredient if it doesn't already exist" do
      recipe = Recipe.new :title => 'test dal', :description => 'try it' , :ingredient_list => '100gms of *masoor dal*',
        :preparation_method => 'test'
      recipe.save
      Ingredient.count.should == 1
      recipe.ingredients.count.should == 1
    end

    it 'links an ingredient to a receipe if the ingredient in the recipe exists' do
      recipe = Recipe.new :title => 'test dal', :description => 'try it' , :ingredient_list => '100gms of *masoor dal*',
        :preparation_method => 'test'
      ingredient = Ingredient.create :title => 'masoor dal'
      recipe.save
      Ingredient.count.should == 1
      recipe.ingredients.count.should == 1
      recipe.ingredients.should include(ingredient)
    end
  end

  context 'when UPDATING recipe' do
  # updates
      it 'creates a new ingredient if we update the existing recipe and add a new ingredient to it.' do
        recipe = Recipe.create :title => 'test dal', :description => 'try it' , :ingredient_list => 'pending',
          :preparation_method => 'test'
        recipe.ingredient_list = '100gms of *toor dal*'
        recipe.save
        Ingredient.count.should == 1
        recipe.ingredients.count.should == 1
        recipe.ingredients.first.title.should == 'toor dal'
      end

      it 'Adds a new ingredient to the recipe and retains the original ingredient' do
        recipe = Recipe.create :title => 'test dal', :description => 'try it' , :ingredient_list => '*masala*',
          :preparation_method => 'test'
        recipe.ingredient_list << '100gms of *toor dal*'
        recipe.save
        Ingredient.count.should == 2
        recipe.ingredients.count.should == 2
        recipe.ingredients.map{ |ingredient| ingredient.title }.should include('masala', 'toor dal')
      end
  end

  context 'when DELETING recipe' do
  # deletes
      it 'Delete the corresponding ingredient of a recipe when the recipe is deleted ONLY IF that ingredient 
      is not used by other recipies' 

      it 'Do not delete the ingredient even when a recipe is deleted if the ingredient is used by other recipe'
      end
  end
end
