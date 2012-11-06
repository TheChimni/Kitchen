class RecipesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :search, :lookup]

  def index
    # using kaminari for paging
    page = params[:page] || 1
    # @recipes is a member variable (indicated by the '@' prefix). Rails makes member variables of a controller
    # automatically accessible from the view template that renders the response for the action.
    @recipes = Recipe.page(page.to_i).per(3)
    return render :partial => 'recipe_list' if request.xhr?
  end

  def search
    search_term = params[:search]
    # @recipes =  Recipe.joins(:ingredients).where('ingredients.title ILIKE ? OR recipes.title ILIKE ?', "%#{search_term}%", "%#{search_term}%").uniq.page(1).per(3)
    @recipes =  Recipe.joins("LEFT OUTER JOIN ingredients_recipes ON ingredients_recipes.recipe_id = recipes.id LEFT OUTER JOIN ingredients ON ingredients.id = ingredients_recipes.ingredient_id")
      .where('ingredients.title ILIKE ? OR recipes.title ILIKE ?', "%#{search_term}%", "%#{search_term}%").uniq.page(1).per(3)

    return render :partial => 'recipe_search' if request.xhr?
  end

  def lookup
    search_term = params[:term]
    matches = Recipe.where("title ILIKE ?","%#{search_term}%").pluck(:title)
    matches += Ingredient.where("title ILIKE ?","%#{search_term}%").pluck(:title)
    render :json => matches
  end


  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end
