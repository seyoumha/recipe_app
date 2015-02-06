class FavoritesController<ApplicationController
	
	before_action :authenticate_user!
	
	def update
		@recipe = Recipe.find(params[:id])
		r = RecipeOption.new(recipe_id: @recipe.id, user_id: current_user.id, option_type: RecipeOption::FAVORITES)
		r.save

		#IDEAL Scenario
		#@recipe.favorited_by(current_user)
		redirect_to :back
	end

	def destroy
		recipe = Recipe.find(params[:recipe_id])
		ro = RecipeOption.where(recipe_id: recipe.id, user_id: current_user.id, option_type: 2).first
		RecipeOption.find(ro.id).destroy
		redirect_to recipe_path
	end
	
end