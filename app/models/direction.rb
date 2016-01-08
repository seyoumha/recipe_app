class Direction < ActiveRecord::Base
	resourcify
	belongs_to :recipe
	belongs_to :user
	validates :instruction, length: {maximum: 255}, presence: true
	 

	before_create do |d|
		if recipe && recipe.directions
			d.order = recipe.directions.count + 1
		end
	end
end
