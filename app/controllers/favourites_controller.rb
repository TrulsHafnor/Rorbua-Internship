class FavouritesController < ApplicationController
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

    if @favourite.save
      redirect_to favourites_url, notice: "Story was added to favourites"
    else
      redirect_to root_path, notice: "Error! Could not add story to favourites!"
    end
  end

  # DELETE /favourites/1 or /favourites/1.json
  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourites_url, notice: "Story was removed from favourites"
  end

end
