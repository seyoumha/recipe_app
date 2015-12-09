class Direction < ActiveRecord::Base
	resourcify
	belongs_to :recipe
	belongs_to :user

	before_create do |d|
		if recipe && recipe.directions
			d.order = recipe.directions.count + 1
		end
	end
end
