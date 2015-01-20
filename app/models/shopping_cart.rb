class ShoppingCart

	attr_accessor :cart_items

	def add(i)
		ingredient = Ingredient.find(i)
		@cart_items = [] unless @cart_items
		@cart_items << {item: ingredient.item, unit: ingredient.unit, amount: ingredient.amount}
		consolidated!
		self
	end

	def remove(item, unit)
		x = self.cart_items.delete_if do |cart_item|
			cart_item[:item] == item && cart_item[:unit] == unit
		end 
		self.cart_items = x 
		self
	end

	def consolidated!
		cart_items2 = []
		@cart_items.group_by{|ci| ci[:item]}.each do |item, ingredients| 
			ingredients.group_by{|ci| ci[:unit]}.map do |unit, ingredients|
				amount = ingredients.sum{|i| i[:amount]}
				cart_items2 << {item: item, unit: unit, amount: amount}
			end
		end
		@cart_items = cart_items2
	end

end
