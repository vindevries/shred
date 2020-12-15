# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
InstructorPackage.destroy_all
InstructorLocation.destroy_all
InstructorLanguage.destroy_all
Instructor.destroy_all
Booking.destroy_all
Language.destroy_all
["English", "German", "Indonesian", "French", "Chinese", "Spanish", "Hindi", "Arabic", "Russian", "Bengali", "Portuguese", "Japanese", "Lahnda"].each { |n| Language.create(name: n) }
Location.destroy_all
["Bali Canggu", "Bali Kuta", "Bali Sanur", "Lombok"].each { |n| Location.create(name: n) }
Package.destroy_all
User.destroy_all

Package.create(title: "Beginner Lesson", duration: 2, photographer: false, rental: true)
Package.create(title: "Beginner Lesson", duration: 2, photographer: true, rental: true)
Package.create(title: "Intermediate Lesson", duration: 2, photographer: false, rental: false)
Package.create(title: "Intermediate Lesson", duration: 2, photographer: false, rental: true)
Package.create(title: "Intermediate Lesson", duration: 2, photographer: true, rental: true)
Package.create(title: "Full day guide", photographer: false, rental: false)
Package.create(title: "Full day guide", photographer: true, rental: true)
Package.create(title: "Full day guide", photographer: true, rental: false)

puts "creating 10 users"
10.times do |i|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    encrypted_password: Faker::Internet.password(min_length: 8)
  )
  puts 'Creating Instructor...'
  instructor = Instructor.create!(
    gender: ["male", "female"].sample
    description: Faker::Quote.famous_last_words,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    user: user
  )
  rand(3..6).times do
    InstructorPackage.create(instructor: instructor, package: Package.all.sample, price: rand(10000 * rand(10..20)))
  end

  rand(3..6).times do
    InstructorLanguage.create(instructor: instructor, language: Language.all.sample)
  end

  rand(3..6).times do
    InstructorLocation.create(instructor: instructor, location: Location.all.sample)
  end
end

puts "finished"


