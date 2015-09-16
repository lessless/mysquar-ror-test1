require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include_examples "has user"
  include_examples "has posts"
  include_examples "use pagination"

  describe "GET #recency" do
    before(:each) do
      get :recency, pagination
    end

    describe "order" do
      let(:pagination) do
        { }
      end

      it "returns records in recency order" do
        expected = [post_2, post_1, post_3]
        payload = JSON::parse(response.body)
        expect(payload['records'].to_json).to eq(expected.to_json)
      end
    end

    describe "pagination" do
      let(:pagination) do
        { page: 1, per_page: 2 }
      end

      it "returns pagination info" do
        payload = JSON::parse(response.body)

        expect(payload['pagination']).to eq(pagination_info)
        expect(payload['records'].length).to eq(2)
      end
    end
  end

  describe "GET #hot" do
    before(:each) do
      10.times do |_|
        create(:like, post_id: post_1.id, user: user, created_at: 59.minutes.ago)
      end

      5.times do |_|
        create(:like, post_id: post_2.id, user: user, created_at: 10.minutes.ago)
      end

      6.times do |_|
        create(:like, post_id: post_3.id, user: user, created_at: 150.minutes.ago)
      end

      get :hot, {page: 1, per_page: 2}
    end

    it "returns records ordered by 'hot'" do
      expected = [post_2, post_1].map { |e| e.as_json }
      payload = JSON::parse(response.body)

      expect(payload['pagination']).to eq(pagination_info)
      expect(payload['records'].to_json).to eq(expected.to_json)
    end
  end

  # describe "GET #trending" do
  #   before(:each) do
  #     10.times do |_|
  #       create(:like, post_id: post_1.id, created_at: 5.minutes.ago)
  #     end

  #     5.times do |_|
  #       create(:like, post_id: post_2.id, created_at: 4.minutes.ago)
  #     end

  #     20.times do |_|
  #       create(:like, post_id: post_3.id, created_at: 3.minutes.ago)
  #     end

  #     get :trending, {page: 1, per_page: 3}
  #   end

  #   it "returns records ordered by popularity" do
  #     JSON::parse(response.body)['records'].tap do |records|
  #       expected = [post_2, post_3, post_1].map { |e| e.as_json }
  #       expect(records).to eq(expected)
  #     end
  #   end
  # end
end

