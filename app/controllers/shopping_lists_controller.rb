class ShoppingListsController < ApplicationController
  
  def index
    @shopping_list = Ingredient.where(id: cart.ingredients) if cart
  end

  def add
    @ingredient = Ingredient.find(params[:id]) 
    cart.add(@ingredient.id)
    save(cart)
    redirect_to recipe_path(@ingredient.recipe), notice: 'successfully added'
  end
  
  def remove
    if id = params[:id]
      cart.remove(id.to_i)
      save(cart)
      
    else
      session.delete(:cart)
    end
    redirect_to shopping_lists_path
  end


  private

  def cart
    unless cart = session[:cart]
      cart = ShoppingCart.new 
      session[:cart] = cart 
    end
    cart
  end
  
  def save(cart)
    session[:cart] = cart 
  end
end
