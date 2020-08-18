FactoryBot.define do
  factory :user do
    nickname              {Faker::Games::Pokemon.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_reading     {"タナカ"}
    first_name_redading   {"タロウ"}
    birthday              {"2000-06-06"}
  end
end
