require 'rails_helper'

RSpec.describe RecentPosts do
  include_examples "has user"
  include_examples "has posts"
  include_examples "use pagination"

  let(:posts_count)     { Post.count }
  let(:ordered_posts)   { Post.order(created_at: :desc) }
  let(:recent_posts) do
   ordered_posts.page(pagination_info["page"]).per(pagination_info["per_page"])
 end


  it "runs successfully" do
    result = RecentPosts.new(pagination_info).execute
    expected = { records: recent_posts, pagination: pagination_info }

    expect(result).to eq(expected)
  end
end
