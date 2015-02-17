class FavoriteRecipe < RecipeOption
	resourcify
	belongs_to :recipe
	belongs_to :user

	validates :recipe_id, uniqueness: {scope: :user_id, message: 'recipe already favorited'}
end
