# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all
puts "----- XXX ------"

num = 25

num.times do |i|
  Project.create(title: Faker::Address.city, description: Faker::Name.name)
end

puts "created #{num} new instances of Project"