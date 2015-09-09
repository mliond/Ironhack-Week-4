# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all
puts "----- XXX ------"

Entry.destroy_all
puts "----- XXX ------"

num = 5

10.times do |i|
  p = Project.new(title: Faker::Address.city, description: Faker::Name.name)
  p.save
  3.times do |k|
    p.entries.create({
      hours: rand(0..4),
      minutes: rand(0..60),
      start_date: Date.today,
      project_id: (107+i), 
      comment: Faker::Hacker.say_something_smart
      })
  end
end

puts "created #{num} new instances of Project"
puts "created 3 new instances of Entry for each Project"