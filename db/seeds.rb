# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

100.times do |i|
  puts "creating author no #{i}"
  Author.create(name: Faker::Name.name, age: Random.rand(27..71), description: Faker::Lorem.paragraph(sentence_count: 3))
end

100.times do |i|
  puts "creating author no #{i}"
  Publisher.create(name: Faker::Book.publisher, year_of_publication: Random.rand(1990..2024))
end
