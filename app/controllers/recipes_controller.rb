class RecipesController < ApplicationController
  def index
    # @recipes is a member variable (indicated by the '@' prefix). Rails makes member variables of a controller
    # automatically accessible from the view template that renders the response for the action.
    @recipes = Recipe.all
  end
end
