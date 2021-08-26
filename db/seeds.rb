require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "test@gmail.com", password: "password")
50.times do
  pet = Pet.new(name: Faker::Name.name, species: Faker::Creature::Animal.name, description: Faker::Quote.most_interesting_man_in_the_world)
  pet.user = user
  file = URI.open("http://loremflickr.com/280/280/ <%= pet.species %>")
  pet.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  pet.save
end
