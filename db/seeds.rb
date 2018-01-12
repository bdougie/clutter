require 'faker'

10.times do
    user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber
        password: Faker::Lorem.characters(10)
    )
    user.skip_confirmation!
    user.save!
end

users = User.all

puts "Seed finished"
puts "#{User.count} users counted"