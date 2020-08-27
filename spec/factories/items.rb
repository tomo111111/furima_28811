FactoryBot.define do
  factory :item do
    name          { Faker::Games::Pokemon.name }
    text          { Faker::Lorem.sentence }
    category_id   { 2 }
    condition_id  { 3 }
    postage_id    { 2 }
    ship_from_id  { 3 }
    ship_date_id  { 3 }
    price         { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
