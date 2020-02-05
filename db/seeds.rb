# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'easymoviy@gmail.com', password: 'easymoviyusing123', password_confirmation: 'easymoviyusing123')
Type.create!(name: 'Series')
Type.create!(name: 'Movies')
Country.create!(name: 'Chinese')
Genre.create!(name: 'Action')
Genre.create!(name: 'Drama')