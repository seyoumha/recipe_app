class AddCoumnRatedRecipesToUser < ActiveRecord::Migration
  def change
    add_column :users, :rated_recipes, :text
  end
end
