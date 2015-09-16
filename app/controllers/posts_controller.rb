class PostsController < ApplicationController
  def recency
    posts = Post.order(created_at: :desc)
    render json: {records: posts}
  end

  def hot
    render nothing: true
  end

  def trending
    render nothing: true
  end
end
