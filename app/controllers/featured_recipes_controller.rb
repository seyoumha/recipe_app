class FeaturedRecipesController < ApplicationController
	before_action :authenticate_user!


	def update
		recipe = Recipe.find(params[:id])
		feature = FeaturedRecipe.new(recipe_id: recipe.id, user_id: current_user.id)
		feature.save
		redirect_to recipes_path, notice: "successfully added to Featured Recipe"

	end

	def destroy
		recipe = Recipe.find(params[:recipe_id])
		featured = FeaturedRecipe.where(recipe_id: recipe.id).first
		featured.destroy
		redirect_to recipes_path, notice: "successfully deleted from Featured Recipe"
	end

	
end