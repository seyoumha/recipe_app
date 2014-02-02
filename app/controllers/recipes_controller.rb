class RecipesController < ApplicationController
	def index
		@recipe = Recipe.all
	end

	def show
		@recipe = Recipe.find(params[:id])
		@ingredients = @recipe.ingredients
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.save
		redirect_to @recipe

	end
	
	private

		def recipe_params
			params.require(:recipe).permit(:title, :description, :direction, :category, :photo)
		end

end
