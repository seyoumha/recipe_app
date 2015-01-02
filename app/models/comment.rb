class Comment < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :user

	self.per_page = 2
end
