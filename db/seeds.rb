# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require "json"
require "open-uri"

Booking.delete_all
Review.delete_all
Venue.delete_all
User.delete_all

puts "Starting seeding..."
User.create(first_name: "test", last_name: "test", username: "test", email: "test@test.com", password: "123456")
# 10.times do

  # venue_types = Venue::VENUE_TYPES.sample

  venue_attributes = Venue::VENUE_ATTRIBUTES

  desc = "The Mayfair Chippy is a quintessentially British restaurant with an emphasis on great fish dishes, serving only the freshest produce to the highest standards.
Fish & Chips is the specialty, but we also serve traditional classic British dishes such as our famous Shepherd’s Pie and Steak & Kidney Pudding. To complement the fabulous food, we also offer a selection of world wines and retro cocktails."

#   venue = Venue.new(
#     name: Faker::Restaurant.name,
#     description: Faker::Restaurant.description,
#     address: Faker::Address.full_address,
#     venue_type: venue_types,
#     venue_type_list: venue_types,
#     venue_attribute: venue_attributes,
#     venue_attribute_list: venue_attributes
#   )

# venue.save!
#   Review.create!(
#     venue: venue,
#     rating: rand(0..5),
#     description: Faker::Restaurant.review,
#     venue_id: venue.id,
#     user: User.first
#   )
# end


# rm = RestClient.get "https://api.yelp.com/v3/businesses/search?location=london&categories=restaurants"


# rm_array = JSON.parse(rm)[“businesses”]

# rm_array.each do |venue|
#  Venue.create(
#   name: venue["name"],
#   description: Faker::Restaurant.description,
#   address: ["location"],
#   venue_type: ["categories"],
#   venue_type_list: ["categories"],
#   venue_attribute: venue_attributes,
#   venue_attribute_list: venue_attributes
#   )
# end

url = "https://api.yelp.com/v3/businesses/search?location=london&term=restaurants&en_GB&limit=50&sort_by=best_match"
data = URI.open(url, "Authorization" => "Bearer #{ENV['YELP_API_KEY']}").read
venues = JSON.parse(data)["businesses"]

venues.each do |ven|
  url_id = "https://api.yelp.com/v3/businesses/#{ven['id']}"
  data_id = URI.open(url_id, "Authorization" => "Bearer #{ENV['YELP_API_KEY']}").read
  venue = JSON.parse(data_id)
  attribute = venue_attributes.sample(3)
  Venue.create(
    name: venue["name"],
    description: desc,
    image: venue["image_url"],
    address: venue["location"]["display_address"].join(', '),
    venue_type: venue["categories"][0]["title"],
    venue_type_list: venue["categories"][0]["title"],
    venue_attribute: attribute,
    venue_attribute_list: attribute
  )
  puts venue
end
