# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
  Booking.destroy_all
  InstructorPackage.destroy_all
  InstructorLocation.destroy_all
  InstructorLanguage.destroy_all
  Instructor.destroy_all
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

    piet = User.create!(
      first_name: "Piet from Holland",
      last_name: "Piet",
      email: "Piet@gmail.com",
      password: "password"
    )
    sarah = User.create!(
      first_name: "Sarah from Sweden",
      last_name: "Sarah",
      email: "Sarah@gmail.com",
      password: "password"
    )
    tyler = User.create!(
      first_name: "Tyler from Australia",
      last_name: "Tyler",
      email: "Tyler@gmail.com",
      password: "password"
    )

  reviewers = [piet, sarah, tyler]

  puts "Finished students"


## CREATING INSTRUCTOR1

puts "Creating Johnny"
  johnny = User.create!(
    first_name: "Johnny",
    last_name: "Laram",
    email: "JohnnyLaram@gmail.com",
    password: "password"
  )


  puts 'Creating Instructor...'
  johnny2 = Instructor.create!(
    gender: "male",
    description: "I'm the dude and offer surf lessions for ass, grass, or cash",
    phone: "+6282147930282",
    user: johnny
  )

  puts "Creating instructor_packages..."
    InstructorPackage.create(instructor: johnny2, package: beginPack1, price: 150000)

    InstructorLanguage.create(instructor: johnny2, language: Language.find_by_name("English"))

    InstructorLocation.create(instructor: johnny2, location: Location.find_by_name("Kuta Lombok"))

    booking1 = Booking.create(description: "Some description", user: piet, instructor_package: johnny2.instructor_packages.sample)
    booking2 = Booking.create(description: "Some description", user: sarah, instructor_package: johnny2.instructor_packages.sample)
    booking3 = Booking.create(description: "Some description", user: tyler, instructor_package: johnny2.instructor_packages.sample)

    puts "Attaching photo..."
  begin
    file = URI.open("https://res.cloudinary.com/apbdevries/image/upload/v1608015111/SHRED/surfer-kai_fkfzz5.jpg")
    johnny2.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  rescue
    johnny2.destroy
  end

  review1 = Review.create(title: "Scum of the lowest order.", description: "Tried to charge me 2 million for a broken fin.", rating: 1, user: reviewers.sample, booking: booking1)
  review2 = Review.create(title: "Total Creep", description: "We agreed via Whatsapp to meet at 9 am by the beach but he was an hour late and visibly hungover. After the session he offered me a ride home if I kissed him. ", rating: 2, user: reviewers.sample, booking: booking2)
  review3 = Review.create(title: "he never responded to my messages!", description: "Waste of a booking deposit.", rating: 1, user: reviewers.sample, booking: booking3)

  puts "Instructor1 done."

  # END OF THIS INSTRUCTOR

puts "Creating Kartika"
  kartika = User.create!(
    first_name: "Kartika",
    last_name: "Sari",
    email: "KartikaSari@gmail.com",
    password: "password"
  )


  puts 'Creating Instructor...'
  kartika2 = Instructor.create!(
    gender: "female",
    description: "Hi I’m Kartika, I’ve been giving surf lesson for 2 years and I like meeting people 😊",
    phone: "+6282147930282",
    user: kartika
  )

  puts "Creating instructor_packages..."
    InstructorPackage.create(instructor: kartika2, package: beginPack1, price: 200000)
    InstructorPackage.create(instructor: kartika2, package: beginPack2, price: 250000)

    InstructorLanguage.create(instructor: kartika2, language: Language.find_by_name("English"))
    InstructorLanguage.create(instructor: kartika2, language: Language.find_by_name("Dutch"))

    InstructorLocation.create(instructor: kartika2, location: Location.find_by_name("Kuta Lombok"))

    booking4 = Booking.create(description: "Some description", user: piet, instructor_package: kartika2.instructor_packages.sample)
    booking5 = Booking.create(description: "Some description", user: sarah, instructor_package: kartika2.instructor_packages.sample)
    booking6 = Booking.create(description: "Some description", user: tyler, instructor_package: kartika2.instructor_packages.sample)

    puts "Attaching photo..."
  begin
    file = URI.open("https://res.cloudinary.com/apbdevries/image/upload/v1608015111/SHRED/Surfer-7_dsxdpk.jpg")
    kartika2.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  rescue
    kartika2.destroy
  end

  review4 = Review.create(title: "Bad Equipment.", description: "The surf equipment we rented was very old.", rating: 2, user: reviewers.sample, booking: booking4)
  review5 = Review.create(title: "Don't think she know how to surf", description: "Couldn’t really explain to us how to surf. Just pushed our board a bit.", rating: 3, user: reviewers.sample, booking: booking5)
  review6 = Review.create(title: "A very nice girl.", description: "Showed me a good night out after the session 😉", rating: 5, user: reviewers.sample, booking: booking6)

  puts "Instructor2 done."

  # END OF THIS INSTRUCTOR

puts "Creating Dewi"
  dewi = User.create!(
    first_name: "Dewi",
    last_name: "Sita",
    email: "DewiSita@gmail.com",
    password: "password"
  )

  puts 'Creating Instructor...'
  dewi2 = Instructor.create!(
    gender: "female",
    description: "Hi I’m Dewi, I’ve been surfing since I was born and am a retired semi-pro surfer, I am an official ASI-certififed surf instructor and surf coach.",
    phone: "+6282147930282",
    user: dewi
  )

  puts "Creating instructor_packages..."
    InstructorPackage.create(instructor: dewi2, package: beginPack1, price: 250000)
    InstructorPackage.create(instructor: dewi2, package: beginPack2, price: 300000)
    InstructorPackage.create(instructor: dewi2, package: fullPack3, price: 800000)

    InstructorLanguage.create(instructor: dewi2, language: Language.find_by_name("English"))
    InstructorLanguage.create(instructor: dewi2, language: Language.find_by_name("German"))
    InstructorLanguage.create(instructor: dewi2, language: Language.find_by_name("Spanish"))

    InstructorLocation.create(instructor: dewi2, location: Location.find_by_name("Kuta Lombok"))

    booking7 = Booking.create(description: "Some description", user: piet, instructor_package: dewi2.instructor_packages.sample)
    booking8 = Booking.create(description: "Some description", user: sarah, instructor_package: dewi2.instructor_packages.sample)
    booking9 = Booking.create(description: "Some description", user: tyler, instructor_package: dewi2.instructor_packages.sample)

    puts "Attaching photo..."
  begin
    file = URI.open("https://res.cloudinary.com/apbdevries/image/upload/v1607437686/SHRED/Surfer-5_vjgyoe.jpg")
    dewi2.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  rescue
    dewi2.destroy
  end

  review7 = Review.create(title: "Great teacher!", description: "The surf equipment we rented was very old.", rating: 5, user: reviewers.sample, booking: booking7)
  review8 = Review.create(title: "Best surf photographer you could ask for.", description: "Took very good fotos of me getting my first waves! Got 500 likes for my surf foto on Instagram!", rating: 5, user: reviewers.sample, booking: booking8)
  review9 = Review.create(title: "She’s got it.", description: "Took us to a secret beginner surf break where we were the only ones there. ", rating: 5, user: reviewers.sample, booking: booking9)

  puts "Instructor3 done."

  # END OF THIS INSTRUCTOR

  puts "finished"
