class IngredientsController < ApplicationController
	before_filter :authenticate_user!
	
	def show
		@ingredient = Ingredient.find(params[:id])
	end

	def new
		@ingredient = Ingredient.new
		@recipe = Recipe.find params[:recipe_id]
		@ingredient.recipe = @recipe
		

	end

	def create
		@recipe = Recipe.find(params[:recipe_id])
		#Ingredient.new item: 'onion', amount: '2', unit: 'small' 
		3.times do |i| 
			item = "item_#{i}".to_sym
			amount = "amount_#{i}".to_sym
			unit =  "unit_#{i}".to_sym

			@ingredient = Ingredient.new(item: params[item], 
										 amount: params[amount], 
										 unit: params[unit])
			@ingredient.recipe = @recipe
			@ingredient.save
		end

		redirect_to @recipe

	end
	def edit
		@recipe = Recipe.find(params[:recipe_id])
		
	end
	def update
		@recipe = Recipe.find(params[:recipe_id])
		@recipe.ingredients.count.times do |i|
			ingredient = Ingredient.find(params["ingredient_#{i}".to_sym ])
			ingredient.item = params["item_#{i}".to_sym]
			ingredient.unit = params["unit_#{i}".to_sym]
			ingredient.amount = params["amount_#{i}".to_sym]
			ingredient.save
		end
		redirect_to recipe_path(@recipe)
		# @ingredient.recipe = @recipe
		# @ingredient.update(ingredient_params)
		# redirect_to @recipe
	end
	
	private

		def ingredient_params
			#params.require(:ingredient).permit(:item, :amount, :unit, :direction, :recipe_id)
			params.permit(:item_0,
						  	:amount_0,
						    :unit_0,
						    :item_1,
						   	:amount_1,
							:unit_1,
							:item_2,
							:amount_2,
							:unit_2,
							:recipe_id)
		end

end
