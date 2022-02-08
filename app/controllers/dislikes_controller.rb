class DislikesController < ApplicationController


  def create
    @dislike = current_user.dislikes.new(dislike_params)
    if !@dislike.save
      flash[:notice] = @dislike.errors.full_messages.to_sentence
    end
    redirect_to @dislike.story
  end

  def destroy
    @dislike = current_user.dislikes.find(params[:id])
    story = @dislike.story
    @dislike.destroy
    redirect_to story
  end

  private

  def dislike_params
    params.require(:dislike).permit(:story_id)
  end


end
