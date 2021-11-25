require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Destroying the database"
HelpRequest.destroy_all
UserCoupon.destroy_all
UserTask.destroy_all
Task.destroy_all
Coupon.destroy_all
Review.destroy_all
User.destroy_all
p "Destroyed!"

def random_address
  # Samples a random, real address from Barcelona, Porto or Sevilla
  ["Passeig de Gracia, Barcelona", "Passeig de Sant Joan, Barcelona", "Passeig del Born, Barcelona",
   "Carrer del Consell de Cent, Barcelona", "Carrer dels Tallers, Barcelona", "Carrer del Blai, Barcelona",
   "Baixada del Monestir, 9, 08034 Barcelona", "Avinguda Diagonal, 686, 08034 Barcelona",
   "Calle circunvalación, 52, 08914 Badalona, Barcelona", "Carrer Sant Jordi, 40, 08923 Santa Coloma de Gramenet, Barcelona",
   "Avinguda de Santa Coloma, 67, 08922 Santa Coloma de Gramenet, Barcelona", "Carrer de Valldonzella, 47, 08001 Barcelona",
   "Av. Dr. Marañón, 11, bajos, 08028 Barcelona", "Carrer de Casanova, 161, 08036 Barcelona",
   "Gran Via de les Corts Catalanes, 322, 324, 08004 Barcelona",
   "Carrer de Sevilla, 2, 08905 L'Hospitalet de Llobregat, Barcelona",
   "20, Carrer de la Feixa Llarga, 14, 08040 Barcelona", "Carrer de Felip II, 08018 Barcelona"].sample
end

def concordance(adjective)
  # Ensures there is concordance in the name of the location
  if %w[a e i o u].include?(adjective[0])
    "an #{adjective}"
  else
    "a #{adjective}"
  end
end

# CREATING THE USERS


p "Creating the helpers"

p "Creating custom user 'John Silver', john@gmail.com."

john = User.new(
  email: "john@gmail.com",
  password: "123456",
  name: "John Silver",
  phone_number: 2834247928,
  gender: "M",
  description: "Young man who misses his grandma and would love to spend some time helping the elderly",
  location: "Carrer de Pau Alsina, 119, 08024 Barcelona",
  user_type: "helper",
  vehicle: true,
  points_balance: 250
)
file = URI.open("https://res.cloudinary.com/dbzm7zcr1/image/upload/v1637751221/john.jpg")
john.avatar.attach(io: file, filename: 'john.png', content_type: 'image/png')
john.save!

p "Creating generic users."

5.times do
  adjective = Faker::Adjective.positive
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    name: Faker::FunnyName.name,
    phone_number: Faker::PhoneNumber.phone_number,
    gender: ["F", "M", "NA"].sample,
    location: random_address,
    user_type: "helper",
    vehicle: false,
    points_balance: Faker::Number.between(from: 0, to: 1000)
  )
  user.description = "Hi! I'm #{user.name}. I'm #{concordance(adjective)} person who wants
  to help the elderly in my area. Let me be your silver helper!"
  file = URI.open("https://source.unsplash.com/collection/9767985")
  user.avatar.attach(io: file, filename: 'john.png', content_type: 'image/png')
  user.save!
  p "Created #{user.name}, a #{user.user_type}"
end

p "Creating custom user 'Jane Bronze', jane@gmail.com."

jane = User.new(
  email: "jane@gmail.com",
  password: "123456",
  name: "Jane Bronze",
  phone_number: 182794319,
  gender: "F",
  description: "Young woman who dreams of being a nurse. Caretaking is my nature. I would love to talk with you!",
  location: "Carrer de Mandri, 62, 08022 Barcelona",
  user_type: "helper",
  vehicle: true,
  points_balance: 100
)

file = URI.open("https://res.cloudinary.com/dbzm7zcr1/image/upload/v1637751226/jane.jpg")
jane.avatar.attach(io: file, filename: 'jane.png', content_type: 'image/png')
jane.save!

p "Creating generic users."

5.times do
  adjective = Faker::Adjective.positive
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    name: Faker::FunnyName.name,
    phone_number: Faker::PhoneNumber.phone_number,
    gender: ["F", "M", "NA"].sample,
    location: random_address,
    user_type: "helper",
    vehicle: false,
    points_balance: Faker::Number.between(from: 0, to: 1000)
  )
  user.description = "Hi! I'm #{user.name}. I'm #{concordance(adjective)} person who wants to help the elderly in my area."
  file = URI.open("https://source.unsplash.com/collection/9767985")
  user.avatar.attach(io: file, filename: 'john.png', content_type: 'image/png')
  user.save!
  p "Created #{user.name}, a #{user.user_type}"
end

##########################
# WARNING: BELOW IS THE BIG RESEED! ONLY TO MAKE IT PRETTIER TO THE PRESENTATION!
# ONLY UNCOMMENT TO RUN FOR HEROKU AND FOR THE PRESENTATION! ALLOW PLENTY OF TIME!
###########################

# 20.times do
#   adjective = Faker::Adjective.positive
#   user = User.new(
#     email: Faker::Internet.email,
#     password: "123456",
#     name: Faker::FunnyName.name,
#     phone_number: Faker::PhoneNumber.phone_number,
#     gender: ["F", "M", "NA"].sample,
#     location: random_address,
#     user_type: "helper",
#     vehicle: false,
#     points_balance: Faker::Number.between(from: 0, to: 1000)
#   )
#   user.description = "Hi! I'm #{user.name}. I'm #{concordance(adjective)} person who wants to help the elderly in my area."
#   file = URI.open("https://source.unsplash.com/collection/9767985")
#   user.avatar.attach(io: file, filename: 'john.png', content_type: 'image/png')
#   user.save!
#   p "Created #{user.name}, a #{user.user_type}"
# end

p "Creating the elderly"

p "Creating custom user 'Maria Silva', maria@gmail.com."

maria = User.new(
  email: "maria@gmail.com",
  password: "123456",
  name: "Maria Silva",
  phone_number: 1234567899,
  gender: "F",
  description: "An old woman with a young soul. Come talk to me about VR sets for old people!",
  location: "Carrer de Prats de Molló, 08021 Barcelona",
  user_type: "elder"
)

file = URI.open("https://res.cloudinary.com/dbzm7zcr1/image/upload/v1637751302/maria.jpg")
maria.avatar.attach(io: file, filename: 'maria.png', content_type: 'image/png')
maria.save!

p "Creating generic elders"

10.times do
  adjective = Faker::Adjective.positive
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    name: Faker::FunnyName.name,
    phone_number: Faker::PhoneNumber.phone_number,
    gender: ["F", "M", "NA"].sample,
    location: random_address,
    user_type: "elder"
  )
  user.description = "Hello. I am #{user.name}. I am #{concordance(adjective)} person who needs help with some tasks."
  file = URI.open("https://source.unsplash.com/collection/98364774")
  user.avatar.attach(io: file, filename: 'john.png', content_type: 'image/png')
  user.save!
  p "Created #{user.name}, an #{user.user_type}"
end

p "Finished creating all the users!"

# CREATING THE COUPONS

p "Creating coupons"

c = 0
5.times do
  c += 1
  name = Faker::Restaurant.name
  discount = Faker::Number.between(from: 0, to: 25)
  Coupon.create!(
    name: "Coupon for #{name}",
    description: "Gives you a discount of #{discount} euro at #{name}, at any of their locations in Barcelona.",
    price: Faker::Number.between(from: 0, to: 250)
  )
  p "Created #{c} coupon(s)!"
end

p "Finished creating coupons."

# CREATING THE TASKS

p "Creating tasks..."
# THE ABOVE WE SHOULD HOPEFULLY GET FROM THE MODEL IN THE FUTURE! with something like TASKS::names
# Feel free to copy and paste it!

UserTask::ALL_TASKS.each do |task|
  Task.create(name: task)
  p "Created #{task}"
end

p "Finished creating tasks"

# CREATING USER TASKS

p "Creating user tasks"

p "Creating user tasks for John"

UserTask.create!(
  user: User.where(name: "John Silver")[0],
  task: Task.where(name: "Groceries")[0]
)

UserTask.create!(
  user: User.where(name: "John Silver")[0],
  task: Task.where(name: "Home repairs")[0]
)

UserTask.create!(
  user: User.where(name: "John Silver")[0],
  task: Task.where(name: "Cleaning")[0]
)

UserTask.create!(
  user: User.where(name: "John Silver")[0],
  task: Task.where(name: "Wheelchair assistance")[0]
)

p "Creating user tasks for Jane"

UserTask.create!(
  user: User.where(name: "Jane Bronze")[0],
  task: Task.where(name: "Wheelchair assistance")[0]
)

UserTask.create!(
  user: User.where(name: "Jane Bronze")[0],
  task: Task.where(name: "Home repairs")[0]
)

UserTask.create!(
  user: User.where(name: "Jane Bronze")[0],
  task: Task.where(name: "Cooking")[0]
)

UserTask.create!(
  user: User.where(name: "Jane Bronze")[0],
  task: Task.where(name: "Company for excursion")[0]
)

p "Creating generic user tasks"

25.times do
  UserTask.create!(
    user: User.all.sample,
    task: Task.all.sample
  )
end

p "Created user tasks!"

# CREATING THE TASKS REQUESTS

p "Creating a pending grocery request between John and Maria"

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "Help me go to Mercadona get the best local products (NOT a sponsored task)",
  status: 0,
  senior_id: User.where(name: "Maria Silva")[0].id,
  helper_id: User.where(name: "John Silver")[0].id,
  task_id: Task.where(name: "Groceries")[0].id
)

p "Creating already accepted request between Jane and Maria"
# enum status: {
#     pending: 0,
#     accepted: 1,
#     declined: 2
#   }

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "Help me go to move my furniture around.",
  status: 1,
  senior_id: User.where(name: "Maria Silva")[0].id,
  helper_id: User.where(name: "Jane Bronze")[0].id,
  task_id: Task.where(name: "Home repairs")[0].id
)

p "Creating reviews for Jane"

Review.create!(
  description: "A wonderful soul that really helped me. She let me teach her catalan and she taught me english.",
  friendliness_rating: 5,
  efficiency_rating: 4,
  punctuality_rating: 5,
  recommend: true,
  help_request_id: HelpRequest.where(task_description: "Help me go to move my furniture around.")[0].id
)
p "Finished creating review for Jane"

p "Assigning coupons to different users"

10.times do
  user = User.all.sample
  coupon = Coupon.all.sample
  UserCoupon.create!(
    user_id: user.id,
    coupon_id: coupon.id
  )
  p "Created coupon from #{coupon.name} for user #{user.name}"
end

p "Creating availabilities"

Availability.create!(
  user: User.where(name: "Jane Bronze")[0],
  weekday: "monday"
)

Availability.create!(
  user: User.where(name: "Jane Bronze")[0],
  weekday: "tuesday"
)

Availability.create!(
  user: User.where(name: "Jane Bronze")[0],
  weekday: "friday"
)

Availability.create!(
  user: User.where(name: "Jane Bronze")[0],
  weekday: "monday"
)

Availability.create!(
  user: User.where(name: "John Silver")[0],
  weekday: "monday"
)
Availability.create!(
  user: User.where(name: "John Silver")[0],
  weekday: "wednesday"
)
Availability.create!(
  user: User.where(name: "John Silver")[0],
  weekday: "thursday"
)
Availability.create!(
  user: User.where(name: "John Silver")[0],
  weekday: "saturday"
)

p "Availabilities created for the custom users!"

10.times do
  Availability.create!(
    user: User.all.sample,
    weekday: Availability::WEEKDAYS.sample
  )
end

p "Availabilities created for generic users!"
