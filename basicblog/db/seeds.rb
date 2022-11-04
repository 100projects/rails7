require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

25.times do |i|
  post = Post.new
  post.title = Faker::Lorem.sentence(word_count: 3, supplemental: true)
  post.content = Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
  post.main_image.attach(io: URI.open("https://picsum.photos/id/1/200/300"), filename: "#{i}_main_image.jpg")
  post.view = Faker::Number.between(from: 1, to: 5000)
  post.save!



end
