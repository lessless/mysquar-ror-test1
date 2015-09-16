RSpec.shared_examples "hot posts" do
  let!(:hot_post) {
    create(:post,user: user, created_at: 30.minutes.ago)
  }

  before(:each) do
    5.times do
      create(:like, post: hot_post, user: user)
      create(:like, post: post_1, user: user, created_at: 2.hours.ago)
    end

    3.times do
      create(:like, post: post_2, user: user)
      create(:like, post: post_3, user: user, created_at: 2.hours.ago)
    end
  end
end
