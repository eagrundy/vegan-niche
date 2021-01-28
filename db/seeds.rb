# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Here I wrote the seed data for my application to test the funcionality of the application
# User.delete_all
# Restaurant.delete_all

# Create an admin user
User.create!(
    username: 'Admin',
    email: 'admin@veganniche.com',
    password: '123456',
    admin: true
)

# Create a normal user
User.create!(
    username: 'Test',
    email: 'test@test.com',
    password: '123456',
    admin: false
)

10.times do 
    Cuisine.create({
        name: Faker::Restaurant.type
    })
end

Restaurant.create(
    name: "Denny's", 
    options: "Fit Fare Veggie Sizzlin’ Skillet without egg whites", 
    source: "Denny's website", 
    image_url: "https://dennys.id/wp-content/uploads/2019/04/skillets-veggie.jpg",
    cuisine_id: rand(1..10))

Restaurant.create(
    name: "Outback Steakhouse", 
    options: "House Salad (No Cheese or Croutons)", 
    source: "vegknowledge.com", 
    image_url: "https://az815214.vo.msecnd.net/web/categories/SignatureSideSalad/ccapp-SignatureSideSalad-2x.png", 
    cuisine_id: rand(1..10))

Restaurant.create(
    name: "IHOP", 
    options: "Crispy Potato Pancakes", 
    source: "vegknowledge.com", 
    image_url: "https://www.vegknowledge.com/wp-content/uploads/elementor/thumbs/Crispy-Potato-Pancake-e1568671295749-odvg02tax54b43t4v080uuhy1nj9p7jxlmnkqo8r14.jpg", 
    cuisine_id: rand(1..10))