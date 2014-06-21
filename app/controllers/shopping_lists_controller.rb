class ShoppingListsController < ApplicationController
  
  def index
    if session[:shopping_list]
      @shopping_list = Ingredient.where(id: session[:shopping_list])
    end
  end

  def add
    @ingredient = Ingredient.find(params[:id]) 
    session[:shopping_list] = [] if session[:shopping_list].nil?
    session[:shopping_list] << @ingredient.id  
    redirect_to recipe_path(@ingredient.recipe), notice: 'successfully added'
  end

  
  def remove
    if params[:id]
      session[:shopping_list].delete(params[:id].to_i)
    else
      session.delete(:shopping_list)
    end
    redirect_to shopping_lists_path
  end

  
end
