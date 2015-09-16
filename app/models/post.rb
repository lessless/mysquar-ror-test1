class Post < ActiveRecord::Base
  validates :user_id, presence: true
  belongs_to :user
  has_many   :likes

  def self.hot
    filter = Like.select(:post_id).
      where("created_at > ?", 1.hour.ago).
      group(:post_id).having("count(*) >= ?", 5)
    Post.where(id: filter)
  end
end
