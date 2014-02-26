class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :recipe

      t.timestamps
    end
    add_index :comments, :recipe_id
  end
end
