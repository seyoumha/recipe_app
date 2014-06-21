class RecipesController < ApplicationController
	before_filter :authenticate_user!, only:[:new, :edit, :create, :update]
	def favorite
		type = params[:type]
		@recipe = Recipe.find(params[:id])
		if type == "favorite"
			current_user.favorites << @recipe
			redirect_to @recipe
		elsif type == "unfavorite"
			current_user.favorites.delete(@recipe)
			redirect_to @recipe
		else
			redirect_to :back
		end
		
	end
	def index
		if params[:search]
			@recipes = Recipe.search(params[:search])
			@search_recipe = (params[:search])
		elsif current_user 
			@recipes = current_user.recipes
			@favorite_recipes = current_user.favorites
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
		15.times{@recipe.ingredients.build}
	end
	def edit
		@recipe = Recipe.find(params[:id])
		10.times{@recipe.ingredients.build}
		
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
	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to @recipe, notice: "Your recipe is deleted"
	end
	
	private

		def recipe_params
			params.require(:recipe).permit(:title, :description, :direction, :category, :photo, :search, ingredients_attributes: [:id, :item, :amount, :unit])
		end

end
