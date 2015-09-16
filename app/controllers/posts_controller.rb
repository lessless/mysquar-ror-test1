class PostsController < ApplicationController
  def recency
    payload = RecentPosts.new(params).execute
    render json: payload
  end

  def hot
    render nothing: true
  end

  def trending
    render nothing: true
  end
end
