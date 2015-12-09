class ShoppingListsController < ApplicationController
  
  def index
    @cart_items = cart.cart_items

  end

  def add
    @ingredient = Ingredient.find(params[:id]) 
    cart.add(@ingredient.id)
    save(cart)
    redirect_to recipe_path(@ingredient.recipe), notice: 'successfully added'
  end
  
  def remove
    item = params[:item]
    unit = params[:unit]
    if item && unit 
      cart.remove(item, unit)
      save(cart)
      
    else
      session.delete(:cart)
    end
    redirect_to shopping_lists_path
  end
  
  def download_pdf
    @consolidated_cart = cart.consolidated! 
    respond_to do |format|
      format.html
      format.pdf do
        html = render_to_string(action: :download_pdf, layout: "pdf.html.haml")
        pdf = WickedPdf.new.pdf_from_string(html)

        send_data(pdf,
          filename: "myShoppigList",
          disposition: 'attachment')
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
