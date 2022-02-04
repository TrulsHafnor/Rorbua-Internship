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

  private

  def story_allready_added_to_favourittes
    logger.error "Attempt to add story already added to favorites"
    redirect_to root_path, notice: 'story already added to favorites'
  end
end

