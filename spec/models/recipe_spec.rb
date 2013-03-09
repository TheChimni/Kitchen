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
  it { should_not validate_presence_of :description }
  it { should validate_presence_of :synopsis }
  it { should validate_presence_of :ingredient_list }
  it { should validate_presence_of :preparation_method }
  it { should validate_presence_of :category }
  it { should ensure_length_of(:synopsis).is_at_most(120) }
  it { should ensure_inclusion_of(:category).in_array(%w(non_vegetarian vegetarian vegan)) }

  it { should have_and_belong_to_many :ingredients }
  it { should have_many :recipe_photos }

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
        recipe = Recipe.new :title => 'test dal', :synopsis => 'try it' , :ingredient_list => '100gms of *masoor dal*',
          :preparation_method => 'test'
        recipe.save
        Ingredient.count.should == 1
        recipe.ingredients.count.should == 1
      end

      it 'links an ingredient to a receipe if the ingredient in the recipe exists' do
        recipe = Recipe.new :title => 'test dal', :synopsis => 'try it' , :ingredient_list => '100gms of *masoor dal*',
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
        recipe = Recipe.create :title => 'test dal', :synopsis => 'try it' , :ingredient_list => 'pending',
          :preparation_method => 'test'
        recipe.ingredient_list = '100gms of *toor dal*'
        recipe.save
        Ingredient.count.should == 1
        recipe.ingredients.count.should == 1
        recipe.ingredients.first.title.should == 'toor dal'
      end

      it 'Adds a new ingredient to the recipe and retains the original ingredient' do
        recipe = Recipe.create :title => 'test dal', :synopsis => 'try it' , :ingredient_list => '*masala*',
          :preparation_method => 'test'
        recipe.ingredient_list << '100gms of *toor dal*'
        recipe.save
        Ingredient.count.should == 2
        recipe.ingredients.count.should == 2
        recipe.ingredients.map{ |ingredient| ingredient.title }.should include('masala', 'toor dal')
      end

      it 'When overwriting the ingredient_list, adds a new ingredient to the recipe and unlinks the original ingredient' do
        recipe = Recipe.create :title => 'test dal', :synopsis => 'try it' , :ingredient_list => '*masala*',
          :preparation_method => 'test'
        recipe.ingredient_list = '100gms of *toor dal*'
        recipe.save
        Ingredient.count.should == 2
        recipe.ingredients.count.should == 1
        recipe.ingredients.first.title.should == 'toor dal'
      end
    end

    context 'when DELETING recipe' do
      # deletes
      it 'Delete the corresponding ingredient of a recipe when the recipe is deleted ONLY IF that ingredient 
    is not used by other recipies' 

    it 'Do not delete the ingredient even when a recipe is deleted if the ingredient is used by other recipe'
    end
  end

  describe '#primary_photo' do
    context 'with 2 photos' do
      subject { Recipe.create! :title => 'test dal', :synopsis => 'try it' , :ingredient_list => '100gms of *masoor dal*', :preparation_method => 'test' }
      before do
        @photo1 = subject.recipe_photos.create(:title => 'photo1', :image => File.open('db/pictures/test.jpeg'))
        @photo2 = subject.recipe_photos.create(:title => 'photo2', :image => File.open('db/pictures/test.jpeg'))
      end

      it 'returns the first photo' do
        subject.primary_photo.should == @photo1
      end
    end
  end

  describe '#similar_recipes' do
    context 'with 5 vegetarian recipes and 2 non-veg' do
      before do
        @vegetarian_recipes = (1..5).map do |counter|
          Recipe.create! :title => "vegetarian recipe #{counter}", :synopsis => 'try it', :ingredient_list => 'pending', :preparation_method => 'test', :category => 'vegetarian'
        end
        @non_vegetarian_recipes = (1..2).map do |counter|
          Recipe.create! :title => "non-vegetarian recipe #{counter}", :synopsis => 'try it', :ingredient_list => 'pending', :preparation_method => 'test', :category => 'non_vegetarian'
        end
      end

      context "the first vegetarian recipe's similar recipes" do
        let(:similar_recipes) { @vegetarian_recipes.first.similar_recipes }

        it 'contains 3 recipes' do
          similar_recipes.count.should == 3
        end

        it 'do not include itself' do
          similar_recipes.should_not include(@vegetarian_recipes.first)
        end

        it 'only includes vegetarian recipes' do
          similar_recipes.each { |recipe| recipe.category.should == 'vegetarian' }
        end
      end

      context "the second vegetarian recipe's similar recipes" do
        let(:similar_recipes) { @vegetarian_recipes[1].similar_recipes }

        it 'contains 3 recipes' do
          similar_recipes.count.should == 3
        end

        it 'do not include itself' do
          similar_recipes.should_not include(@vegetarian_recipes[1])
        end

        it 'only includes vegetarian recipes' do
          similar_recipes.each { |recipe| recipe.category.should == 'vegetarian' }
        end
      end

      context "the second non-vegetarian recipe's similar recipes" do
        let(:similar_recipes) { @non_vegetarian_recipes[1].similar_recipes }

        it 'contains 1 recipe' do
          similar_recipes.count.should == 1
        end

        it 'do not include itself' do
          similar_recipes.should_not include(@non_vegetarian_recipes[1])
        end

        it 'only includes non-vegetarian recipes' do
          similar_recipes[0].should == @non_vegetarian_recipes[0]
        end
      end
    end
  end
end
