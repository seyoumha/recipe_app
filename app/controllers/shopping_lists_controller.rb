class ShoppingListsController < ApplicationController
  
  def index
    @shopping_list = Ingredient.where(id: cart.ingredients) if cart
    @consolidated_ingredients = cart.consolidated_ingredients

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
  def download_pdf
  consolidated_cart = cart.consolidated_ingredients 
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ShoppingListPdf.new(consolidated_cart)
        send_data pdf.render, filename: 'shopping_list.pdf', type: 'application/pdf'
      end
    end

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
