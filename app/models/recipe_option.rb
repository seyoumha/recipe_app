class RecipeOption < ActiveRecord::Base
	FEATURED_ITEMS = 1
	FAVORITES = 2

	validates :recipe_id, uniqueness: {scope: :user_id, message: 'recipe already favorited'}
end
