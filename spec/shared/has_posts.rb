RSpec.shared_examples "has posts" do
  let!(:post_1) {
    create(:post, user: user, created_at: 2.hours.ago)
  }

  let!(:post_2) {
    create(:post, user: user, created_at: 1.hours.ago)
  }

  let!(:post_3) {
    create(:post, user: user, created_at: 3.hours.ago)
  }
end
