class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ edit update destroy ]


  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new

    @comment.story = Story.find(params[:story_id])
    @comment.user = current_user
    @comment.text = comment_params[:text]

    respond_to do |format|
      if @comment.save
        flash[:notice] = "Comment was successfully added."
      else
        flash[:notice] = @favourite.errors.full_messages.to_sentence
      end
    end
    redirect_back(fallback_location: root_path)
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to story_url(@comment.story), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @story =  @comment.story
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to story_url(@story), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:text)
    end
end
