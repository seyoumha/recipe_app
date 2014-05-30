class PageController < ApplicationController
  def index
  	@tags = Hash.new(0)
  	Recipe.all.each{|recipe|
  		recipe.tags.each{|word|
  			@tags[word] += 1
  		}
  	}

  end
end
