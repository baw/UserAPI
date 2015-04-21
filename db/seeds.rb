# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cities = [
  "Austin",
  "Columbus",
  "London",
  "New York City",
  "Paris",
  "Philadelphia",
  "Portland",
  "San Francisco"
]

cities_length = cities.length

(0...1000).each do
  city_index = (rand * cities_length).floor
  User.create({
    username: Faker::Internet.user_name,
    password: Faker::Internet.password,
    city: cities[city_index],
    profession: Faker::Name.title
  })
end

User.create(
  username: "user",
  password: "pass",
  city: "San Francisco",
  profession: "Mail delivery agent"
)