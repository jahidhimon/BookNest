# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do |i|
  puts "creating author no #{i}"
  Author.create(
    name: Faker::Name.name,
    age: Random.rand(27..71),
    description: Faker::Lorem.paragraph(sentence_count: 30))
end

10.times do |i|
  puts "creating publisher no #{i}"
  Publisher.create(
    address: Faker::Address.full_address,
    name: Faker::Book.publisher,
    description: Faker::Lorem.paragraph(sentence_count: 3),
  )
end

100.times do |i|
  puts "creating book no #{i}"
  Book.create(
    title: Faker::Book.title,
    isbn: "9780066620992",
    edition: "1",
    available: true,
    year_of_publication: Random.rand(1990..2024),
    category: Faker::Book.genre,
    description: Faker::Lorem.paragraph(sentence_count: 50),
    author_id: Random.rand(1...10),
    publisher_id: Random.rand(1...10)
  )
end

10.times do |i|
  puts "creating users no #{i}"
  User.create(
    name: Faker::Name.name,
    password: "helloworld",
    password_confirmation: "helloworld",
    email: Faker::Internet.email,
    mobile_phone: "01629599965"
  )
end

User.create(
  name: "Jahid Hasan",
  password: "helloworld",
  password_confirmation: "helloworld",
  email: "jahid1794@gmail.com",
  mobile_phone: "299292"
)
User.last.confirm
