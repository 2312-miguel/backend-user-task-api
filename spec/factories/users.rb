FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    full_name { Faker::Name.name }
    role { ['admin', 'user'].sample }
  end
end