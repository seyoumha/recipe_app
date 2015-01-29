class RatingsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@recipe = Recipe.find(params[:id])
		@stars = params[:stars]
		@recipe.set_rating(@stars.to_i)
		current_user.rated(@recipe)
		@recipe.save
		current_user.save
		render nothing: true
	end





	# def update
	# 	@rating = Rating.find(params[:id])
	# 	@recipe = @rating.recipe
	# 	if @rating.update_attributes(score: params[:score])
	# 	  respond_to do |format|
	# 	    format.js
	# 	  end
	# 	end
	# end




end