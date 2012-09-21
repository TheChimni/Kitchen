class RecipePhotosController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_photo = RecipePhoto.new
  end

  def create
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_photo = RecipePhoto.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
