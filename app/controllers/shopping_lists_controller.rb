class ShoppingListsController < ApplicationController
  
  def index
    @cart_items = cart.cart_items

  end

  def add
    @ingredient = Ingredient.find(params[:id]) 
    cart.add(params[:id])
    save(cart)
    redirect_to recipe_path(@ingredient.recipe), notice: 'successfully added'
  end

  def add_all
    recipe_id = params[:rid]
    ingredient_ids = params[:ids]
    ingredient_ids.each{|i| cart.add(i)}
    save(cart)
    redirect_to recipe_path(recipe_id), notice: "successfully added #{ingredient_ids.length} ingredients"
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

  def email_pdf
    @user = User.where(user_params)
    @consolidated_cart = cart.consolidated! 
        pdf = render_to_string :pdf => "email_pdf"
        Sendpdf.pdf_email(@user, pdf).deliver
        flash[:notice] = 'Email has been sent!'
        redirect_to recipes_path()

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
    def user_params
      params.permit(:id)
    end
  
end
