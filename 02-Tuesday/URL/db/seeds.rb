10.times do |i|
  long_url = Faker::Internet.url 
  short_url = (i + 100)
  Link.create(long_url: long_url, short_url: short_url)
end
