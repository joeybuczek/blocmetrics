require 'faker'

# Create test user
user = User.new(
  name:              "Terry Golden",
  email:             "tgolden@example.com",
  password:          "password"
)
user.skip_confirmation!
user.save

# Create Registered Applications for user
5.times do
  Application.create!(
    name:         Faker::Lorem.sentence(3),
    url:          Faker::Internet.url,
    user:         user
  )
end
apps = Application.all

# Create events for apps
event_types = Faker::Lorem.words(5)
event_types = ["Sign in", "Sign out", "Purchase", "Reset Password", "Error 404"]

250.times do
  Event.create!(
    name:         event_types[rand(3)],
    application:  apps.sample,
    logged_str:   Faker::Date.backward(30)
  )
end

25.times do
  Event.create!(
    name:         event_types[rand(5)],
    application:  apps.sample,
    logged_str:   Faker::Date.backward(30)
  )
end

puts "Seeding finished."
puts "#{User.count} users created."
puts "#{Application.count} apps created."
puts "#{Event.count} events created."