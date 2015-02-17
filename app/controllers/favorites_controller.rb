class FavoritesController < ApplicationController
	
	before_action :authenticate_user!
	
	def update
		recipe = Recipe.find(params[:id])
		r = FavoriteRecipe.new(recipe_id: recipe.id, user_id: current_user.id)
		r.save
		render nothing: true
	end

	def destroy
		recipe = Recipe.find(params[:recipe_id])
		fav = FavoriteRecipe.where(recipe_id: recipe.id, user_id: current_user.id).first
		fav.destroy
		# RecipeOption.find(ro.id).destroy
		render nothing: true
	end
	
end