module RecipesHelper
	def recipe_featured?(recipe)
		featured = FeaturedRecipe.where(recipe_id: recipe.id)
		if featured.present?
	      return true
	  	end

	end
end
