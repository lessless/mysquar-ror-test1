require 'rails_helper'

RSpec.describe HotPosts do
  include_examples "has user"
  include_examples "has posts"
  include_examples "hot posts"
  include_examples "use pagination"

  it "return hot posts json" do
    result = described_class.new(pagination_info).execute
    expected = { records: [hot_post], pagination: pagination_info }
  end
end
