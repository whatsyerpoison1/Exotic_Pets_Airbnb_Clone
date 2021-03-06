require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Pet.destroy_all
User.destroy_all

user = User.create(email: "test@gmail.com", password: "password")
50.times do
  puts "making pet"
  pet = Pet.new(name: Faker::Name.name, species: Faker::Creature::Animal.name, price: rand(1000..20000) ,description: Faker::Quote.most_interesting_man_in_the_world)
  pet.user = user
  pet.save

  file = URI.open("http://loremflickr.com/280/280/#{pet.species}")
  pet.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  puts 'finishing pet'
end
