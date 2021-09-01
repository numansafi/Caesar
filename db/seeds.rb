# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

venue = Venue.new(
  name: 'Mcdonalds',
  description: 'Michelin starred American bistro',
  address: '100 Main Street',
  venue_type: 'Restaurant',
  venue_attributes: 'charming'
)
puts "finished seed"
venue.save!
  Review.create!(
    venue: venue,
    rating: rand(0..100),
    description: 'Best in town',
    user_id: 1,
    venue_id: 1
  )
