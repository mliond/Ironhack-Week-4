Book.destroy_all

puts "deleted all"

10.times do |i|
  b = Book.create({
    name: Faker::Internet.user_name,
    description: Faker::Hacker.say_something_smart,
    price: rand(5..25)
    })
  3.times do |k|
    b.reviews.create({
      name: Faker::Internet.user_name,
      text: Faker::Hacker.say_something_smart,
      stars: rand(1..5)
      })
  end
end

puts "created new ones"