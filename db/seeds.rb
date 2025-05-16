require 'faker'

User.destroy_all

# Create test user with specific token
test_user = User.create!(
  email: 'test@example.com',
  full_name: 'Test User',
  role: 'admin'
)

3.times do
  test_user.tasks.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph,
    status: ['pending', 'in_progress', 'done'].sample,
    due_date: Faker::Date.forward(days: 30)
  )
  test_user.update_column(:auth_token, 'test-token-123')
end

3.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    full_name: Faker::Name.name,
    role: ['admin', 'user'].sample
  )

  5.times do
    user.tasks.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph,
      status: ['pending', 'in_progress', 'done'].sample,
      due_date: Faker::Date.forward(days: 30)
    )
  end
end
