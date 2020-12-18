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
    description: "Never try never know! I'm rocking bro!",
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
    file = URI.open("https://res.cloudinary.com/apbdevries/image/upload/v1608046378/SHRED/Surfer-12_oe0cym.jpg")
    johnny2.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  rescue
    johnny2.destroy
  end

  review1 = Review.create(title: "Rip off.", description: "Tried to charge me 2 million for a broken fin.", rating: 1, user: piet, booking: booking1)
  review2 = Review.create(title: "Unreliable", description: "We agreed via Whatsapp to meet at 9 am by the beach but he was an hour late and visibly hungover.", rating: 2, user: sarah, booking: booking2)
  review3 = Review.create(title: "he never responded to my messages!", description: "Waste of a booking deposit.", rating: 1, user: tyler, booking: booking3)

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
    InstructorLanguage.create(instructor: kartika2, language: Language.find_by_name("Indonesian"))

    InstructorLocation.create(instructor: kartika2, location: Location.find_by_name("Kuta Lombok"))

    booking4 = Booking.create(description: "Some description", user: piet, instructor_package: kartika2.instructor_packages.sample)
    booking5 = Booking.create(description: "Some description", user: sarah, instructor_package: kartika2.instructor_packages.sample)
    booking6 = Booking.create(description: "Some description", user: tyler, instructor_package: kartika2.instructor_packages.sample)

    puts "Attaching photo..."
  begin
    file = URI.open("https://res.cloudinary.com/apbdevries/image/upload/v1608046378/SHRED/Surfer-13_w2oczg.jpg")
    kartika2.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  rescue
    kartika2.destroy
  end

  review4 = Review.create(title: "Bad Equipment.", description: "The surf equipment we rented was very old.", rating: 2, user: tyler, booking: booking4)
  review5 = Review.create(title: "Don't think she know how to surf", description: "Couldn’t really explain to us how to surf. Just pushed our board a bit.", rating: 3, user: sarah, booking: booking5)
  review6 = Review.create(title: "A very nice girl.", description: "Showed me a good night out after the session 😉", rating: 5, user: piet, booking: booking6)

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
    description: "Hi I’m Dewi, I’ve been surfing since I was born and am a retired pro surfer, I am a surf instructor, surf coach, and am passionate wave photographer.",
    phone: "+6282147930282",
    user: dewi
  )

  puts "Creating instructor_packages..."
    InstructorPackage.create(instructor: dewi2, package: beginPack1, price: 250000)
    InstructorPackage.create(instructor: dewi2, package: beginPack2, price: 450000)
    InstructorPackage.create(instructor: dewi2, package: fullPack3, price: 800000)

    InstructorLanguage.create(instructor: dewi2, language: Language.find_by_name("English"))
    InstructorLanguage.create(instructor: dewi2, language: Language.find_by_name("German"))
    InstructorLanguage.create(instructor: dewi2, language: Language.find_by_name("Spanish"))
    InstructorLanguage.create(instructor: dewi2, language: Language.find_by_name("Indonesian"))


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

  review7 = Review.create(title: "Great teacher!", description: "Taught a very brief but comprehensive theory session before our lesson.", rating: 5, user: tyler, booking: booking7)
  review8 = Review.create(title: "Best surf photographer you could ask for.", description: "Took very good fotos of me getting my first waves! Got 500 likes for my surf foto on Instagram!", rating: 5, user: sarah, booking: booking8)
  review9 = Review.create(title: "She’s got it.", description: "Took us to a secret beginner surf break where we were the only ones there. ", rating: 5, user: piet, booking: booking9)

  puts "Instructor3 done."

  # END OF THIS INSTRUCTOR

puts "Creating Riz"
  riz = User.create!(
    first_name: "Riz",
    last_name: "Dog",
    email: "RizDog@gmail.com",
    password: "password"
  )

  puts 'Creating Instructor...'
  riz2 = Instructor.create!(
    gender: "male",
    description: "Hi I’m Riz, I'm a surf guide for experienced surfers.",
    phone: "+6282147930282",
    user: riz
  )

  puts "Creating instructor_packages..."
    InstructorPackage.create(instructor: riz2, package: intPack1, price: 250000)
    InstructorPackage.create(instructor: riz2, package: intPack2, price: 300000)
    InstructorPackage.create(instructor: riz2, package: intPack3, price: 500000)

    InstructorLanguage.create(instructor: riz2, language: Language.find_by_name("English"))
    InstructorLanguage.create(instructor: riz2, language: Language.find_by_name("German"))
    InstructorLanguage.create(instructor: riz2, language: Language.find_by_name("Indonesian"))

    InstructorLocation.create(instructor: riz2, location: Location.find_by_name("Canggu Bali"))

    booking10 = Booking.create(description: "Some description", user: piet, instructor_package: riz2.instructor_packages.sample)
    booking11 = Booking.create(description: "Some description", user: sarah, instructor_package: riz2.instructor_packages.sample)
    booking12 = Booking.create(description: "Some description", user: tyler, instructor_package: riz2.instructor_packages.sample)

    puts "Attaching photo..."
  begin
    file = URI.open("https://res.cloudinary.com/apbdevries/image/upload/v1608046378/SHRED/Surfer-10_tqlka0.jpg")
    riz2.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  rescue
    riz2.destroy
  end

  review10 = Review.create(title: "Great guide!", description: "Took us to the secret spots.", rating: 5, user: piet, booking: booking10)
  review11 = Review.create(title: "Rude", description: "A good guide was a bit arrogant", rating: 3, user: sarah, booking: booking11)
  review12 = Review.create(title: "He’s got it.", description: "Took us to a secret surf break where we were the only ones there. ", rating: 5, user: tyler, booking: booking12)

  puts "Instructor4 done."

  # END OF THIS INSTRUCTOR

puts "Creating Alit"
  alit = User.create!(
    first_name: "Alit",
    last_name: "Alit",
    email: "AlitAlit@gmail.com",
    password: "password"
  )

  puts 'Creating Instructor...'
  alit2 = Instructor.create!(
    gender: "male",
    description: "Hi I’m Alit, I know all the best surf spots in Bali and love to show people around the island!",
    phone: "+6282147930282",
    user: alit
  )

  puts "Creating instructor_packages..."
    InstructorPackage.create(instructor: alit2, package: beginPack1, price: 200000)
    InstructorPackage.create(instructor: alit2, package: beginPack2, price: 450000)
    InstructorPackage.create(instructor: alit2, package: fullPack3, price: 900000)

    InstructorLanguage.create(instructor: alit2, language: Language.find_by_name("English"))
    InstructorLanguage.create(instructor: alit2, language: Language.find_by_name("Indonesian"))

    InstructorLocation.create(instructor: riz2, location: Location.find_by_name("Canggu Bali"))
    InstructorLocation.create(instructor: riz2, location: Location.find_by_name("Kuta Bali"))

    booking13 = Booking.create(description: "Some description", user: piet, instructor_package: alit2.instructor_packages.sample)
    booking14 = Booking.create(description: "Some description", user: sarah, instructor_package: alit2.instructor_packages.sample)
    booking15 = Booking.create(description: "Some description", user: tyler, instructor_package: alit2.instructor_packages.sample)

    puts "Attaching photo..."
  begin
    file = URI.open("https://res.cloudinary.com/apbdevries/image/upload/v1608258527/SHRED/surfer-14_uqw1km.jpg")
    alit2.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  rescue
    alit2.destroy
  end

  review13 = Review.create(title: "unreliable", description: "was 2 hours late to our lesson.", rating: 2, user: piet, booking: booking13)
  review14 = Review.create(title: "Rude", description: "A good guide but was a bit arrogant", rating: 3, user: sarah, booking: booking14)
  review15 = Review.create(title: "He’s got it.", description: "Took us to a secret surf break where we were the only ones there. ", rating: 5, user: tyler, booking: booking15)

  puts "Instructor5 done."

  # END OF THIS INSTRUCTOR

puts "Creating Rosita"
  rosita = User.create!(
    first_name: "Rosita",
    last_name: "Rosita",
    email: "RositaRosita@gmail.com",
    password: "password"
  )

  puts 'Creating Instructor...'
  rosita2 = Instructor.create!(
    gender: "female",
    description: "Hi I’m Rosita, I give beginner lesson and take surf photos. I've been surfing all my life.",
    phone: "+6282147930282",
    user: rosita
  )

  puts "Creating instructor_packages..."
    InstructorPackage.create(instructor: rosita2, package: beginPack1, price: 200000)
    InstructorPackage.create(instructor: rosita2, package: beginPack2, price: 400000)

    InstructorLanguage.create(instructor: rosita2, language: Language.find_by_name("English"))
    InstructorLanguage.create(instructor: rosita2, language: Language.find_by_name("Indonesian"))

    InstructorLocation.create(instructor: riz2, location: Location.find_by_name("Canggu Bali"))

    booking16 = Booking.create(description: "Some description", user: piet, instructor_package: rosita2.instructor_packages.sample)
    booking17 = Booking.create(description: "Some description", user: sarah, instructor_package: rosita2.instructor_packages.sample)
    booking18 = Booking.create(description: "Some description", user: tyler, instructor_package: rosita2.instructor_packages.sample)

    puts "Attaching photo..."
  begin
    file = URI.open("https://res.cloudinary.com/apbdevries/image/upload/v1608260199/SHRED/Surfer-15_ttjdvd.jpg")
    rosita2.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  rescue
    rosita2.destroy
  end

  review16 = Review.create(title: "unreliable", description: "was 2 hours late to our lesson.", rating: 1, user: piet, booking: booking16)
  review17 = Review.create(title: "Nice instructor", description: "A good guide and took me out after", rating: 4, user: sarah, booking: booking17)
  review18 = Review.create(title: "She’s got it.", description: "Took us to a secret surf break where we were the only ones there. ", rating: 5, user: tyler, booking: booking18)

  puts "Instructor6 done."

  # END OF THIS INSTRUCTOR

  puts "finished"
