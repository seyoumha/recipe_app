module RecipesHelper
	
	def recipe_featured?(recipe)
		featured = FeaturedRecipe.where(recipe_id: recipe.id)
		if featured.present?
	      return true
	  	end

	end
	def raters
		z=[]
		if @recipe.ratings_hash.present?
        	@recipe.ratings_hash.each do |x,y|
        		z<<y
        	end
        	z.sum
        
    	end
    end

	def min_to_hr(cooking_time = 0, prep_time = 0)
		h = (prep_time + cooking_time)/60
		m = (((prep_time.to_f + cooking_time.to_f))%60).round
			h.to_s + " h " + m.to_s + " m"
	end





end
