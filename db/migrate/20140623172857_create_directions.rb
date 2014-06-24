class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :order
      t.text :instruction

      t.timestamps
    end
  end
end
