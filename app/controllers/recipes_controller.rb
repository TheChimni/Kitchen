class RecipesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    # @recipes is a member variable (indicated by the '@' prefix). Rails makes member variables of a controller
    # automatically accessible from the view template that renders the response for the action.
    @recipes = Recipe.all
    return render :layout => false if request.xhr?
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
