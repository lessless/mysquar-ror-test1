require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user) }
  it { should have_many(:likes) }
end

