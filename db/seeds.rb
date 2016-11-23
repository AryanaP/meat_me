require 'faker'

5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: ["Male", "Female"].sample,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    password: "password",
    age: (18..70).to_a.sample,
    phone_number: Faker::PhoneNumber.phone_number,
    host: true
    )
  user.save!
end

10.times do
  meal = Meal.new(
    name: Faker::App.name,
    address: '16 villa gaudelet',
    city: "Paris",
    date: Faker::Date.forward(100),
    description: Faker::Lorem.sentence,
    food_type: ["Asiatique", "Oriental", "Italien", "Américain"].sample,
    meeting_type: ["Fun", "Hot", "Professionnel"].sample,
    price: (10..100).to_a.sample,
    user_id: [1, 2, 3, 4, 5].sample
  )
  meal.save!
end

5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: ["Male", "Female"].sample,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    password: "password",
    age: (18..70).to_a.sample,
    phone_number: Faker::PhoneNumber.phone_number,
    host: false
    )
  user.save!
end
