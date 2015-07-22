# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do
  Movie.create(
    title: Faker::Lorem.words.join(' '),
    rating: ['NC17', 'R', 'PG13', 'PG', 'G'].sample
  )
end
