# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# this a complete seed property you 
# can be repeated to test the ability to keep seeding the database

property = Property.new(description: 'A view that you will never get tired of', name: 'A very nice house by lake', address: '123 avenue,aavenue,city')
photo1 = Rails.root.join( 'app', 'assets', 'images', 'house-cover-4.jpeg')
photo2 = Rails.root.join( 'app', 'assets', 'images', 'house-cover-6.jpeg')
photo3 = Rails.root.join( 'app', 'assets', 'images', 'house-cover-7.webp')
property.photos.attach(io: File.open(photo1), filename: 'house-cover-4.jpeg')
property.photos.attach(io: File.open(photo2), filename: 'house-cover-6.jpeg')
property.photos.attach(io: File.open(photo3), filename: 'house-cover-7.webp')
property.save
