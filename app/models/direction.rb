class Direction < ActiveRecord::Base
	resourcify
	belongs_to :recipe
	belongs_to :user
end
