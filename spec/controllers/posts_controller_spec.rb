require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }

  let!(:post_1) {
    create(:post, user: user, created_at: 2.hours.ago)
  }

  let!(:post_2) {
    create(:post, user: user, created_at: 1.hours.ago)
  }

  let!(:post_3) {
    create(:post, user: user, created_at: 3.hours.ago)
  }

  describe "GET #recency" do
    before(:each) do
      get :recency, pagination
    end

    describe "order" do
      let(:pagination) do
        { }
      end

      it "returns records in recency order" do
        JSON::parse(response.body)['records'].tap do |records|
          expected = [post_2, post_1, post_3].map { |e| e.as_json }
          expect(records).to eq(expected)
        end
      end
    end

    describe "pagination" do
      let(:pagination) do
        { page: 1, per_page: 2 }
      end

      it "returns pagination info" do
        JSON::parse(response.body)['pagination'].tap do |pagination|
          expect(pagination).to eq({
            'page' => 1,
            'per_page' => 2,
            'total_count' => 3
          })
        end
      end
    end
  end

  describe "GET #hot" do
    before(:each) do
      10.times do |_|
        create(:like, post_id: post_1.id, created_at: 90.minutes.ago)
      end

      5.times do |_|
        create(:like, post_id: post_2.id, created_at: 10.minutes.ago)
      end

      6.times do |_|
        create(:like, post_id: post_3.id, created_at: 150.minutes.ago)
      end

      get :hot, {page: 1, per_page: 3}
    end

    it "returns records ordered by 'hot'" do
      JSON::parse(response.body)['records'].tap do |records|
        expected = [post_2, post_1].map { |e| e.as_json }
        expect(records).to eq(expected)
      end
    end
  end

  describe "GET #trending" do
    before(:each) do
      10.times do |_|
        create(:like, post_id: post_1.id, created_at: 5.minutes.ago)
      end

      5.times do |_|
        create(:like, post_id: post_2.id, created_at: 4.minutes.ago)
      end

      20.times do |_|
        create(:like, post_id: post_3.id, created_at: 3.minutes.ago)
      end

      get :trending, {page: 1, per_page: 3}
    end

    it "returns records ordered by popularity" do
      JSON::parse(response.body)['records'].tap do |records|
        expected = [post_2, post_3, post_1].map { |e| e.as_json }
        expect(records).to eq(expected)
      end
    end
  end
end

