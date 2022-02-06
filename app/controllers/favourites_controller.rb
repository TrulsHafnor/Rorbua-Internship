class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /favourites or /favourites.json
  def index
    @favourites = Favourite.where(user_id: current_user)
  end

  # POST /favourites or /favourites.json
  def create
    @favourite = Favourite.new
    @favourite.story = Story.find(params[:story_id])
    @favourite.user = current_user

    respond_to do |format|
      if @favourite.save
        format.html { redirect_to favourites_url, notice: "Story was added to favourites" }
        format.json { render :show, status: :created, location: @favourite }
      else
        format.html { redirect_to root_path, notice: "Error! Could not add story to favourites!" }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1 or /favourites/1.json
  def destroy
    @favourite.destroy

    respond_to do |format|
      format.html { redirect_to favourites_url, notice: "Story was removed from favourites"}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_params
      params.fetch(:favourite, {})
    end
end
