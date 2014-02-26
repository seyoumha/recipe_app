class CommentsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    @comment.user = current_user
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @recipe = Recipe.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
