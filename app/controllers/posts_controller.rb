class PostsController < ApplicationController
  def recency
    payload = RecentPosts.new(params).execute
    render json: payload
  end

  def hot
    payload = HotPosts.new(params).execute
    render json: payload
  end

  def trending
    render nothing: true
  end
end
