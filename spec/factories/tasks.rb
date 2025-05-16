FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    status { ['pending', 'in_progress', 'done'].sample }
    due_date { Faker::Date.forward(days: 30) }
    association :user
  end
end