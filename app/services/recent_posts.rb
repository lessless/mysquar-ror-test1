class RecentPosts < PaginatedPosts
  def posts
    Post.order(created_at: :desc)
  end
  private :posts
end
