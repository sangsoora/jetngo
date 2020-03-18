# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts 'Creating 3 users'
User.create(email: "leon@hotmail.com", password: "lewagon1", first_name: "le", last_name: "ellerb")
User.create(email: "sangsoo@hotmail.com", password: "lewagon2", first_name: "sangoo", last_name: "ellerbr")
User.create(email: "abder@hotmail.com", password: "lewagon3", first_name: "abder", last_name: "ellerbrock")
puts 'Creating 3 fake cities...'
3.times do
  city = City.new(
    name:    Faker::Nation.capital_city
  )
  city.save!
end
puts 'Finished!'

puts 'Creating 10 fake jets...'
10.times do
  jet = Jet.new(
    model:    Faker::name,
    name: Faker::Company.name,
    capacity:  rand(4..15),
    unit_price: rand(1000..10000),
    city_id: rand(1..10),
    user_id: rand(1..3)
  )
  jet.save!
end
puts 'Finished!'
