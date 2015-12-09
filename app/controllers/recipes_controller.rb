class RecipesController < ApplicationController
	before_action :authenticate_user!, only:[:new, :edit, :create, :update]
	before_action :find_recipe, only: [:update, :destroy, :favorite, :edit, :show] 
	

	def index
		if params[:search]
			@recipes = Recipe.search(params[:search])
			@search_recipe = (params[:search])
		elsif current_user 
			@recipes = current_user.recipes
			@favorited_recipes = current_user.favorited_recipes

			
		else
			@recipes = Recipe.all
		end	
	end

	def show
		@ingredients = @recipe.ingredients
		@directions = @recipe.directions
		@direction = @recipe.directions.build

		@comments =  @recipe.comments.paginate(:page => params[:page])

	end

	def new
		@recipe = Recipe.new
		15.times{@recipe.ingredients.build}
	end

	def edit
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
		@recipe.update(recipe_params)
		redirect_to @recipe, notice: 'Your recipe is updated'
	end

	def destroy
		@recipe.destroy
		redirect_to @recipe, notice: "Your recipe is deleted"
	end
	
	private

		def recipe_params
			params.require(:recipe).permit(:title, :description, :category, :photo, :search, :prep_time, :cook_time, :servings, ingredients_attributes: [:id, :item, :amount, :unit])
		end
		def find_recipe
			@recipe = Recipe.find(params[:id])
		end

end
