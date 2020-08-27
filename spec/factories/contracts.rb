FactoryBot.define do
  factory :contract do
    association :user
    association :item
  end
end
