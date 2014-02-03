class RecipesController < ApplicationController
	def index
		if params[:search]
			@recipes = Recipe.search(params[:search])
		else
			@recipes = current_user.recipes
		end	
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
		@recipe.user = current_user	
		@recipe.save
		redirect_to @recipe

	end
	def search
		@recipe = Recipe.find(params[:title])

	end
	
	private

		def recipe_params
			params.require(:recipe).permit(:title, :description, :direction, :category, :photo, :search)
		end

end
