class RecipeController < ApplicationController
    before_action :authenticate_user!

    def index
        @recipes = current_user.recipes
    end

    def new
        @recipe = Recipe.new
    end
    def show
    @recipe = Recipe.find(params[:id])
    @preparation_time_minutes = @recipe.preparation_time_minutes
    @preparation_time_hours = @recipe.preparation_time_hours
    @cooking_time_minutes = @recipe.cooking_time_minutes
    @cooking_time_hours = @recipe.cooking_time_hours
    end



      private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :public)
  end

  def calculate_minutes(hours, minutes)
    (hours.to_i * 60) + minutes.to_i
  end
end
