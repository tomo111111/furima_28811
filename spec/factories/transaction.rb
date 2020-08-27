FactoryBot.define do
  factory :transaction do
    postal_code   { '123-4567' }
    prefecture_id { 5 }
    city          { '東京' }
    house_number  { '7-7' }
    building_name { 'マンション' }
    phone_number  { '12345678901' }
    token         { 'abcdefghijkimn' }

    user_id       {}
  end
end
