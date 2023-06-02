class FoodController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
  end

  def create
    @food = current_user.foods.build(food_params.except(:recipe_id))
    recipe_id = food_params[:recipe_id]

    if @food.save
      recipe = Recipe.find(recipe_id)
      if recipe
        RecipeFood.create!(recipe_id:, food_id: @food.id, quantity: @food.quantity)
        redirect_back fallback_location: root_path, notice: 'Food was successfully created.'
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:food_id])
    @food.destroy
  end
end
