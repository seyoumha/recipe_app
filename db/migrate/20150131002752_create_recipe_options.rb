class CreateRecipeOptions < ActiveRecord::Migration
  def change
    create_table :recipe_options do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :option_type, default: 0
      t.timestamps
    end
  end
end
