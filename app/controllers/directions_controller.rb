class DirectionsController < ApplicationController
  before_action :find_recipe
  before_action :set_direction, only: [:destroy, :update, :edit]
  def new
    @direction = @recipe.directions.build
  end
  def index
    @directions = @recipe.directions
  end

  def create
    @direction = @recipe.directions.build(direction_params)
    respond_to do |format|
      if @direction.save
        format.html { redirect_to @recipe, notice: 'Direction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @direction }
      else
        format.html { render action: 'new' }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /directions/1
  # PATCH/PUT /directions/1.json
  def edit
    
  end

  def update
    respond_to do |format|
      if @direction.update(direction_params)
        format.html { redirect_to @recipe, notice: 'Direction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directions/1
  # DELETE /directions/1.json
  def destroy
    @direction.destroy
    respond_to do |format|
      format.html { redirect_to @recipe }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_recipe
      @recipe = Recipe.find params[:recipe_id]
    end
    def set_direction
      @direction = Direction.find(params[:id])
      @direction = @direction
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direction_params
      params.require(:direction).permit(:order, :instruction)
    end
end
