class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def edit
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    @recipe.save
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
