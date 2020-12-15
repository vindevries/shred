# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
InstructorPackage.destroy_all
InstructorLocation.destroy_all
InstructorLanguage.destroy_all
Instructor.destroy_all
Booking.destroy_all
Language.destroy_all
["English", "German", "Indonesian", "French", "Chinese", "Spanish", "Hindi", "Arabic", "Russian", "Portuguese", "Japanese", "Korean"].each { |n| Language.create(name: n) }
Location.destroy_all
["Bali Canggu", "Bali Kuta", "Bali Sanur", "Kuta Lombok"].each { |n| Location.create(name: n) }
Package.destroy_all
User.destroy_all
puts "Database cleaned"


puts "Creating packages"

beginPack1 = Package.create(title: "Beginner Lesson", duration: 2, photographer: false, rental: true)
beginPack2 = Package.create(title: "Beginner Lesson", duration: 2, photographer: true, rental: true)
intPack1 = Package.create(title: "Intermediate Lesson", duration: 2, photographer: false, rental: false)
intPack2 = Package.create(title: "Intermediate Lesson", duration: 2, photographer: false, rental: true)
intPack3 = Package.create(title: "Intermediate Lesson", duration: 2, photographer: true, rental: true)
fullPack1 = Package.create(title: "Full day guide", photographer: false, rental: false)
fullPack2 = Package.create(title: "Full day guide", photographer: true, rental: true)
fullPack3 = Package.create(title: "Full day guide", photographer: true, rental: false)

puts "Packages created"



puts "Creating students"

  mick = User.create!(
    first_name: "Mick",
    last_name: "Mauz",
    email: "Mick@gmail.com",
    password: "password"
  )
  paul = User.create!(
    first_name: "paul",
    last_name: "Mauz",
    email: "paul@gmail.com",
    password: "password"
  )
  john = User.create!(
    first_name: "john",
    last_name: "Mauz",
    email: "john@gmail.com",
    password: "password"
  )
  lenn = User.create!(
    first_name: "lenn",
    last_name: "Mauz",
    email: "lenn@gmail.com",
    password: "password"
  )
  bob = User.create!(
    first_name: "bob",
    last_name: "Mauz",
    email: "bob@gmail.com",
    password: "password"
  )


reviewers = [mick, paul, john, lenn, bob]

puts "Finished students"

## CREATING INSTRUCTOR

puts "Creating Johnny"
  johnny = User.create!(
    first_name: "Johnny",
    last_name: "Laram",
    email: "JohnnyLaram@gmail.com",
    password: "password"
  )


  puts 'Creating Instructor...'
  instructor = Instructor.create!(
    gender: "male",
    description: "I'm the Dude and offer surf lessions for ass, grass, or cash",
    phone: "+6282147930282",
    user: johnny
  )

  puts "Creating instructor_packages..."
    InstructorPackage.create(instructor: instructor, package: beginPack1, price: 150000)

    InstructorLanguage.create(instructor: instructor, language: Language.find_by_name("English"))

    InstructorLocation.create(instructor: instructor, location: Location.find_by_name("Kuta Lombok"))

    booking1 = Booking.create(description: "Some description", user: johnny, instructor_package: johnny.instructor.instructor_packages.sample)

    puts "Attaching photo..."
  begin
    file = URI.open("https://picsum.photos/id/#{rand(0..300)}/200/300")
    instructor.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  rescue
    instructor.destroy
  end

  review1 = Review.create(title: "Some title", description: "Some description", rating: 5, user: reviewers.sample, booking: booking1)


  puts "Instructor done."
  # END OF THIS INSTRUCTOR


puts "finished"


