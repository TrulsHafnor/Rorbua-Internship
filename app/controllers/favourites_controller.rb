class FavouritesController < ApplicationController
  before_action :authenticate_user!

  # GET /favourites or /favourites.json
  def index
    @favourites = Favourite.where(user_id: current_user)
  end

  # POST /favourites or /favourites.json
  def create
    @favourite = Favourite.new
    @story = Story.find(params[:story_id])

    @favourite.story = @story
    @favourite.user = current_user

    if @favourite.save
      flash[:notice] = "Story was added to favourites"
    else
      flash[:notice] = @favourite.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: root_path)
  end

  # DELETE /favourites/1 or /favourites/1.json
  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    flash[:notice] = "Story was removed from favourites"
    redirect_back(fallback_location: root_path)
  end

end
