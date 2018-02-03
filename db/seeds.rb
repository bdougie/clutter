require 'faker'

sam = User.new(
  name: 'Sahil Mehta',
  email: 'samehta91@gmail.com',
  password: 'password',
  phone_number: '5625477684',
  street_address: '500 William Street, Unit 429',
  city: 'Oakland',
  state: 'CA',
  zip: '94612',
  service: 'Standard',
  appointment: '2018-02-08 16:20:00',
  second_appointment: '2018-02-15 16:20:00'
)
sam.skip_confirmation!
sam.save!

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
    appointment: Faker::Date.forward(30)
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
    appointment: Faker::Date.forward(10),
    second_appointment: Faker::Date.forward(20),
    third_appointment: Faker::Date.forward(30)
  )
  user.skip_confirmation!
  user.save!
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "Seed finished"
puts "#{User.count} users counted"