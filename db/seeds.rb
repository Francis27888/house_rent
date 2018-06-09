require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(names: 'Kelly Eric', email: 'kelly@eric.com', phone_number: '0788374782', user_category: 'House Owner', password: 'kelly1', password_confirmation: 'kelly1')
user2 = User.create!(names: 'Anet Anne', email: 'anet@anne.com', phone_number: '0783672674', user_category: 'House Owner', password: 'anet10', password_confirmation: 'anet10')

5.times do
  location = Faker::Address.city
  number_of_rooms =  Faker::Number.between(1, 10)
  description = Faker::Lorem.paragraph(8)
  house = House.new(location: location, number_of_rooms: number_of_rooms, description: description)
  house.user_id = user1.id
  house.save!
end

3.times do
  location = Faker::Address.city
  number_of_rooms =  Faker::Number.between(1, 10)
  description = Faker::Lorem.paragraph(8)
  house = House.new(location: location, number_of_rooms: number_of_rooms, description: description)
  house.user_id = user2.id
  house.save!
end