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

end