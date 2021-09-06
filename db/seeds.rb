# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Booking.delete_all
Venue.delete_all
Review.delete_all
User.delete_all

puts "Starting seeding..."
User.create(first_name: "test", last_name: "test", username: "test", email: "test@test.com", password: "123456")
10.times do

  venue_types = ["Indian", "Italian", "Chinese","Thai","Mexican","American"]

  venue_attributes = ["Outdoor Space", "Disabled Toilets", "Disabled Access", "Disabled Parking", "Accommodating Staff", "Flexible Menu", "Dim Lighting", "Large Interior Space", "No Music", "Not Crowded", "Multiple Exits","No Strong Smells","Activities For Children","Mostly Families", "Outside Food Allowed"]

  venue = Venue.new(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    address: Faker::Address.full_address,
    venue_type: venue_types.sample,
    venue_type_list: venue_types.sample,
    venue_attribute: venue_attributes.sample,
    venue_attribute_list: venue_attributes.sample
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
