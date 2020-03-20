# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'

puts '*' * 30
puts "Start seeding"

puts 'Creating 3 users'
User.create(email: "leon@hotmail.com", password: "lewagon1", first_name: "le", last_name: "ellerb")
User.create(email: "sangsoo@hotmail.com", password: "lewagon2", first_name: "sangoo", last_name: "ellerbr")
User.create(email: "abder@hotmail.com", password: "lewagon3", first_name: "abder", last_name: "ellerbrock")
User.create(email: "emi@gmail.com", password: "123456", first_name: "emi", last_name: "dogaru")
puts "Done creating users"

puts 'Creating 3 fake cities...'
City.create(name: "Valencia")
City.create(name: "Madrid")
City.create(name: "Barcelona")
City.create(name: "Frankfurt")
City.create(name: "Los Angeles")
City.create(name: "Seoul")
City.create(name: "Montreal")
City.create(name: "Bucharest")
City.create(name: "Amsterdam")
puts 'Done creating cities!'

puts 'Creating 10 fake jets...'
jets_data_file = open(File.join(__dir__, 'jets.json')).read
jets_data = JSON.parse(jets_data_file)

jet_count = 1
jet_price = {
  "Small Prop" => (30_000...50_000),
  "Small Jet" => (55_000...70_000),
  "Medium Jet" => (70_000...80_000),
  "Regional Airliner" => (120_000...140_000)
}

jets_data.each do |jet_data|
  puts jet_data.except("photo_link")
  jet = Jet.new(jet_data.except("photo_link"))

  photo = URI.open(jet_data["photo_link"])
  jet.photos.attach(io: photo, filename: "jet_photo#{jet_count}", content_type: 'image/jpg')
  jet_count += 1

  jet.unit_price = rand(jet_price[jet.size])

  jet.user_id = rand(1..3)
  jet.city_id = rand(1..9)

  jet.save!
end

# jet_models = [
#   { model: "Very light",
#     price_range: (5000...10000),
#     capacity: (4..6)
#   }},
#   { model: "Light business",
#     price_range: (10000...15000),
#     capacity: (5..6)
#   }},
#   { model: "Midsize business",
#     price_range: (15000...20000),
#     capacity: (5..10)
#   }},
#   { model: "Super midsize business",
#     price_range: (20000...25000),
#     capacity: (8..10)
#   }},
#   { model: "Large business",
#     price_range: (30000...35000),
#     capacity: (10..14)
#   }},
#   { model: "Heavy (Bizliner)",
#     price_range: (35000...40000),
#     capacity: (14..18)
#   }},
# ]


# 10.times do
#   jet_data = jet_models.sample
#   jet = Jet.new(
#     model:    jet_data[:model],
#     name: Faker::Company.name,
#     capacity:  rand(4..15),
#     unit_price: rand(1000..10000),
#     city_id: rand(1..3),
#     user_id: rand(1..3)
#   )
#   jet.save!
# end
puts 'Done creating jets!'

puts 'Seeding ended'
puts '*' * 30
