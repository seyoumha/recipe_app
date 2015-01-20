class AddFeaturedRecipeToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :featured_recipe, :boolean
  end
end
