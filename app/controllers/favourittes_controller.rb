class FavourittesController < ApplicationController
  #rescue_from ActiveRecord::RecordNotUnique, with: :story_already_added_to_favorites

  # GET /stories or /stories.json
  def index
    @favourittes = Favouritte.all
  end

  # POST /stories or /stories.json
  def create
    @favouritte = Favouritte.new
    @favouritte.story = Story.find(params[:story_id])
    @favouritte.user = current_user

    respond_to do |format|
      if @favouritte.save
        format.html { redirect_to favourittes_path, notice: "Story was successfully added to favourittes." }
        format.json { render :show, status: :created, location: @favouritte }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
        format.json { render json: @favouritte.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /stories/1 or /stories/1.json
  def destroy
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url, notice: "Story was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @story = current_user.stories.find_by(id: params[:id])
    redirect_to stories_path, notice: "Not Authorized To Edit This Story" if @story.nil?
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def story_params
    params.require(:story).permit(:title, :description, :story_file, :user_id)
  end

  def story_allready_added_to_favourittes
    logger.error "Attempt to add story already added to favorites"
    redirect_to root_path, notice: 'story already added to favorites'
  end
end

