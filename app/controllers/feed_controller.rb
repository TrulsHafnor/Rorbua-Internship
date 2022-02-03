class FeedController < ApplicationController
  def index
    @stories = Story.all
  end
end
