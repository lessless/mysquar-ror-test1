class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
end
