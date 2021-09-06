# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Venue.delete_all
Review.delete_all

puts "Starting seeding..."
User.create(first_name: "Scott", last_name: "Johnson", username: "scott2020", email: "scott@gmail.com", password: "123456")
10.times do
  venue = Venue.new(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    address: Faker::Address.full_address,
    venue_type: Faker::Restaurant.type,
    venue_attribute: ["Disabled Access", "Disabled Parking", "Quiet", "Dim Lighting"].sample
  )


venue.save!
  Review.create!(
    venue: venue,
    rating: rand(0..5),
    description: Faker::Restaurant.review,
    venue_id: venue.id,
    user: User.first
  )
end

puts "finished seed!"
