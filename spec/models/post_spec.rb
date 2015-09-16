require 'rails_helper'

RSpec.describe Post, type: :model do
  include_examples "has user"
  include_examples "has posts"

  describe "#hot" do
    include_examples "hot posts"

    it 'fetch posts that received more than 5 likes  during last hour' do
      expect(described_class.hot).to eq([hot_post])
    end
  end

  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user) }
  it { should have_many(:likes) }
end

