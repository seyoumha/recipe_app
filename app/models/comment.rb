class Comment < ActiveRecord::Base
	resourcify
	belongs_to :recipe
	belongs_to :user

	self.per_page = 2
end
