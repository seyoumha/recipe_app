class ShoppingCart

	attr_accessor :ingredients
	
	def initialize
		@ingredients = []
	end

	def add(i)
		@ingredients << i
		self
	end

	def remove(i)
		self.ingredients.delete(i)
		self
	end
	
	def ingredient_items
		 Ingredient.find(ingredients)
	end

	def consolidated_ingredients
		consolidated_ingredients = []
		ingredient_items.group_by{|i| i.item}.each do |item,ingredients| 
			result = ingredients.group_by{|i| i.unit}.map do |unit,ingredients|
				amount = ingredients.sum{|i| i.amount}
				consolidated_ingredients << {item: item, unit: unit, amount: amount}
			end
		end
		consolidated_ingredients
	end

	# def consolidated_ingredients
	# 	ingredient_items.to_a.group_by{|i| i.item}.each do |item,i| 
	# 		consolidated_ingredients = i.group_by{|i| i.unit}.map{|unit,i|
	# 			{item: item, unit: unit, amount: i.sum{|i|i.amount}}
	# 		}
	# 	end
	# 	consolidated_ingredients
	# end

end