# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
first_file = URI.open('https://res.cloudinary.com/dfxqhh8wb/image/upload/v1582325835/qssp9ams3tsggkmbyck30norzi66.jpg')

drinks_serialized = open(url).read
drink_list = JSON.parse(drinks_serialized)

drink_list["drinks"].each do |drink|
  Ingredient.create(
    name: drink["strIngredient1"]
  )
end
Cocktail.destroy_all
puts 'destroying cocktail.....'

first_cocktail = Cocktail.create(name: "Mojitos")
first_cocktail.photo.attach(io: first_file, filename: "qssp9ams3tsggkmbyck30norzi66.jpg", content_type: 'image/jpg')
