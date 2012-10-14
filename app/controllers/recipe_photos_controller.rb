class RecipePhotosController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_photo = RecipePhoto.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    # @recipe_photo = RecipePhoto.new(params[:recipe_photo])
    # @recipe_photo.recipe = @recipe
    # @recipe_photo = @recipe.recipe_photos.build(params[:recipe_photo])
    # if @recipe_photo.save
    if @recipe.recipe_photos.create(params[:recipe_photo])
      redirect_to edit_recipe_path(@recipe)
    else
      render :new
    end
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
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_photo = RecipePhoto.find(params[:id])
    @recipe_photo.destroy
    redirect_to edit_recipe_path(@recipe)
  end

end
