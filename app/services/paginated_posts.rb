class PaginatedPosts
  def initialize(params)
    @page     = params["page"]
    @per_page = params["per_page"]
  end

  def execute
    {records: records, pagination: pagination}
  end

private
  def records
    posts.page(@page).per(@per_page)
  end

  def pagination
    {
      "page"        =>  @page,
      "per_page"    =>  @per_page,
      "total_count" =>  Post.count.to_s
    }
  end
end
