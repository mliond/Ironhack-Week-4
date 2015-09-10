# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all
Entry.destroy_all
User.destroy_all

puts "----- XXX ------"

user1 = User.create(username: Faker::Name.name)
user2 = User.create(username: Faker::Name.name)
user3 = User.create(username: Faker::Name.name)
users = [user1, user2, user3]

num = 5

num.times do |i|
  p = Project.new(title: Faker::Address.city, description: Faker::Company.name)
  p.save
  3.times do |k|
    current_user = users.sample
    p.entries.create({
      user_id: current_user.id,
      hours: rand(0..4),
      minutes: rand(0..60),
      start_date: Date.today,
      comment: Faker::Hacker.say_something_smart
      })
  end
end

puts "created #{num} projects with 3 entries each as well as 3 users "