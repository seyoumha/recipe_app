class FeaturedRecipe < RecipeOption
	belongs_to :recipe
	validates :recipe_id, uniqueness: :true
	
end