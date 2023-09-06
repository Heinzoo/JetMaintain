# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.create(
  email: "admin@mail.com",
  password: "123456",
  role: 1
)

20.times do
  num_type = [0, 1].sample
  if num_type == 0
    nombre = 'REAC-' + Faker::Number.unique.number(digits: 10).to_s
  else
    nombre = 'TURBO-' + Faker::Number.unique.number(digits: 10).to_s
  end
  link = ['https://farm8.staticflickr.com/7462/15811169587_6c218ea42d_b.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqp8zgDBLuRiQAOFMgYVgjhTAHRKJ7n2xtuQ&usqp=CAU', ''].sample
  
  Motor.create(
    type_motor: num_type,
    name: nombre,
    description: Faker::Lorem.paragraph,
    photo: link
  )
end

100.times do
  user = User.all.sample
  motor = Motor.all.sample

  Mantenimiento.create(
    type_motor: motor.type_motor,
    type_mantenimiento: [0, 1].sample,
    motor_name: motor.name,
    city: ['Santiago de Chile', 'Temuco', 'Antofagasta'].sample,
    material: ['Turbinas', 'Sistemas de ignición', 'Sistemas de combustible'].sample,
    date_mantenimiento: Faker::Date.between(from: '2020-01-01', to: '2023-12-31'),
    user_email: user.email,
    user_id: user.id,
    motor_id: motor.id,
  )
end