25.times do |i|
  name = Faker::Name.name
  address = Faker::Address.street_address
  phone = Faker::PhoneNumber.phone_number
  email = Faker::Internet.email
  Contact.create(name: name, address: address, phone: phone, email: email)
end
