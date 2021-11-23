# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Destroying the database"
User.destroy_all
HelpRequest.destroy_all
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



p "Creating the helpers"

p "Creating custom user 'John Silver', john@gmail.com."

User.create!(
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
  user.save!
  p "Created #{user.name}, a #{user.user_type}"
end

p "Creating custom user 'Jane Bronze', jane@gmail.com."

User.create!(
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
  user.save!
  p "Created #{user.name}, a #{user.user_type}"
end

p "Creating the elderly"

p "Creating custom user 'Maria Silva', maria@gmail.com."

User.create!(
  email: "maria@gmail.com",
  password: "123456",
  name: "Maria Silva",
  phone_number: 1234567899,
  gender: "F",
  description: "An old woman with a young soul. Come talk to me about VR sets for old people!",
  location: "Carrer de Prats de Molló, 08021 Barcelona",
  user_type: "elder"
)

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
  user.save!
  p "Created #{user.name}, an #{user.user_type}"
end

p "Creating grocery help between John and Maria"

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "Help me go to Mercadona get the best local products (NOT a sponsored task)",
  status: 1,
  task_category: "Groceries",
  senior_id: User.where(name: "Maria Silva")[0].id,
  helper_id: User.where(name: "John Silver")[0].id
)
