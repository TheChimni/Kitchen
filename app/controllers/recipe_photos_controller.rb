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
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_photo = RecipePhoto.find(params[:id])
    # raise params.inspect
    if @recipe_photo.update_attributes(params[:recipe_photo])
      redirect_to edit_recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
  end

end
