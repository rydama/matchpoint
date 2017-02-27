# Sample data for development

abort("Don't run db:seed in production") if Rails.env.production?

users = []
5.times do |n|
  users << User.create!(
    email: Faker::Internet.email,
    password: "test")
end

tournaments = []
5.times do |n|
  tournaments << Tournament.create!(
    name: "#{Faker::University.name} Classic",
    description: Faker::Lorem.paragraph,
    start_at: 7.days.from_now + n.weeks,
    end_at: 8.days.from_now + n.weeks,
    owner: users[n])
end

# Register all the users for the first tournament.
users.each do |user|
  Registration.create!(user: user, tournament: tournaments.first)
end
