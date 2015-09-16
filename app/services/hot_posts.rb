class HotPosts < PaginatedPosts
  def posts
    Post.hot.order(created_at: :desc)
  end
  private :posts
end
