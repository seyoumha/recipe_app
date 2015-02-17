class PageController < ApplicationController
  def index
  	@tags = Hash.new(0)
  	Recipe.all.each{|recipe|
  		recipe.tags.each{|word|
  			@tags[word] += 1
  		}
  	}
  	
    featured_recipe_ids = []
    FeaturedRecipe.all.each do |fr|
      rid = fr.recipe_id
      featured_recipe_ids << rid
    end

    @featured_recipes = Recipe.where(id: featured_recipe_ids)

  end

  def create
    recipe = Recipe.find(params[:id])
    f = FeaturedRecipe.new(recipe_id: recipe.id)
    f.save
    render nothing: true
  end

end
