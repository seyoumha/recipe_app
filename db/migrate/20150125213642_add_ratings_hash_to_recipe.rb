class AddRatingsHashToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :ratings_hash, :text
  end
end
