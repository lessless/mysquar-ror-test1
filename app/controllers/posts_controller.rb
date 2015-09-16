class PostsController < ApplicationController
  def recency
    page     = params[:page]
    per_page = params[:per_page]
    posts    = Post.order(created_at: :desc).page(page).per(per_page)

    render json: {
      records: posts,
      pagination: {
        page: page,
        per_page: per_page,
        total_count: Post.count.to_s
      }
    }
  end

  def hot
    render nothing: true
  end

  def trending
    render nothing: true
  end
end
