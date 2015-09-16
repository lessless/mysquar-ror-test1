FactoryGirl.define do
  factory :post do
    sequence(:text) { |n| "Text #{n}"}
  end
end

