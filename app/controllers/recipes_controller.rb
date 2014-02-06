class RecipesController < ApplicationController
	before_filter :authenticate_user!, only:[:new, :edit, :create, :update]
	def index
		if params[:search]
			@recipes = Recipe.search(params[:search])
			@search_recipe = (params[:search])
		elsif current_user 
			@recipes = current_user.recipes
		else
			@recipes = Recipe.all
		end	
	end

	def show
		@recipe = Recipe.find(params[:id])
		@ingredients = @recipe.ingredients
	end

	def new
		@recipe = Recipe.new
	end
	def edit
		@recipe = Recipe.find(params[:id])
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.user = current_user		
		if @recipe.save
			redirect_to @recipe
		else
			render action: 'new'
		end


	end
	def update
		@recipe = Recipe.find(params[:id])
		@recipe.update(recipe_params)
		redirect_to @recipe, notice: 'Your recipe is updated'
	end
	
	private

		def recipe_params
			params.require(:recipe).permit(:title, :description, :direction, :category, :photo, :search)
		end

end
