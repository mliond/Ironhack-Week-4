# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.all.destroy_all
Product.all.destroy_all

puts "Deleted all users and products"

num = 5

num.times do |i|
  u = User.new({
    name: Faker::Name.name,
    email: Faker::Internet.email
    })
  u.save
  3.times do |k|
    u.products.create({
      title: Faker::Hacker.abbreviation,
      description: Faker::Hacker.say_something_smart,
      deadline: Faker::Time.between(DateTime.now + 10, DateTime.now),
      user_id: i
      })
  end
end


puts "Created #{num} new users with 3 entries each."