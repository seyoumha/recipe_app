class PageController < ApplicationController
  def index
  	@tags = Hash.new(0)
  	Recipe.all.each{|recipe|
  		recipe.tags.each{|word|
  			@tags[word] += 1
  		}
  	}
  	
  	@featured_recipes = []
  	Recipe.all.each do |recipe|
  		if recipe.featured_recipe.present?
  			@featured_recipes << recipe
  		end
  	end

  end
end
