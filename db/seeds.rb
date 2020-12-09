# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Language.destroy_all
["English", "German", "Indonesian", "French", "Chinese", "Spanish", "Hindi", "Arabic", "Russian", "Bengali", "Portuguese", "Japanese", "Lahnda"].each { |n| Language.create(name: n) }
Location.destroy_all
["Bali Changgu", "Bali Kuta", "Bali Sanur", "Lombok"].each { |n| Location.create(name: n) }
Package.destroy_all
Package.create(title: "Beginner Lesson", duration: 2, photographer: false, rental: true)
Package.create(title: "Beginner Lesson", duration: 2, photographer: true, rental: true)
Package.create(title: "Intermediate Lesson", duration: 2, photographer: false, rental: false)
Package.create(title: "Intermediate Lesson", duration: 2, photographer: false, rental: true)
Package.create(title: "Intermediate Lesson", duration: 2, photographer: true, rental: true)
Package.create(title: "Full day guide", photographer: false, rental: false)
Package.create(title: "Full day guide", photographer: true, rental: true)
Package.create(title: "Full day guide", photographer: true, rental: false)

