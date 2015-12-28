class ChangeColumn < ActiveRecord::Migration
  def change
  	def self.up
   		add_column :ingredients, :unit, :float
 	end

 	def self.down
   		remove_column :ingredients, :unit, :integer 
 	end


  end
end
