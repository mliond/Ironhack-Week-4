Concert.destroy_all

puts "deleted all concerts."

num = 25

(num).times do |i|
  c = Concert.new({
    band: Faker::Internet.user_name,
    venue: Faker::Address.street_name,
    city: Faker::Address.city,
    date: Faker::Time.between(DateTime.now - 2, DateTime.now + 2),
    price: rand(5..50),
    description: Faker::Hacker.say_something_smart,
    poster: Faker::Avatar.image
    })
  c.save
  3.times do |k|
    c.comments.create({
      name: Faker::Internet.user_name,
      text: Faker::Hacker.say_something_smart
      })
  end
end

3.times do |i|
  User.create({
    name: Faker::Internet.name,
    password: "test"
    })
end

puts "created #{num} new concerts with 3 comments each."