class PostsController < ApplicationController
  def recency
    render json: {}
  end

  def hot
    render nothing: true
  end

  def trending
    render nothing: true
  end
end
