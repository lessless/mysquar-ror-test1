require 'rails_helper'

RSpec.describe 'Like', type: :model do
  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:post) }
  it { should belong_to(:user) }
end
