require 'faker'

admin = User.new(
  name: 'Sahil Mehta',
  email: 'samehta91@gmail.com',
  password: 'password',
  phone_number: '5625477684',
  street_address: '500 William Street, Unit 429',
  city: 'Oakland',
  state: 'CA',
  zip: '94612',
  service: 'Standard',
  appointment: '2018-04-20 16:20:00'
)
admin.skip_confirmation!
admin.save!

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    phone_number: Faker::PhoneNumber.cell_phone,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip_code,
    service: 'Starter',
    appointment: Faker::Date.forward(365)
  )
  user.skip_confirmation!
  user.save!
end

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    phone_number: Faker::PhoneNumber.cell_phone,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip_code,
    service: 'Premium',
    appointment: Faker::Date.forward(365)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

puts "Seed finished"
puts "#{User.count} users counted"