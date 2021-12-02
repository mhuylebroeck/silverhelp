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
Favorite.destroy_all
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


classmates = [
  {
    name: "Diana C. Barroso",
    description: "Hello! I am Diana, and I am mexican/american, currently living in Barcelona. I have a culinary/hospitality background; and during the pandemic I started to be curious about helping seniors and now I am ready to give it a try.",
    photo: "https://avatars.githubusercontent.com/u/90432547?v=4"
  },
  {
    name: "Josep Carbonell",
    description: "Before joining Le Wagon I've done a 'Superior Grade' of marketing and advertising and there is when I first did something of coding and I liked a lot.
When I graduated I decided to join Silverhelp to learn everything and work as a helper.",
    photo: "https://avatars.githubusercontent.com/u/88286752?v=4"
  },
  {
    name: "Cyprien Eckert",
    description: "I interrupted my senior engineering degree in order to come here and learn how to help elders faster. I wish to keep learning after Silverhelp, whether it is through experience by finding an immediate job, or by undertaking another educational activity.",
    photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633880462/nfhvr4joxfuc7vr6jbdy.jpg"
  },
  {
    name: "Øyvind Fossum",
    description: "Hi my name is Øyvind, 32 year old from Norway.

I currently work as a structural engineer in Copenhagen, Denmark. I joined Silverhelp cause I've always wanted to get into helping elder and gain the elder mindset. I also often have an impulse to help elders coming to me out of nowhere, and I'd love to have the ability to quickly do it. I think Silverhelp can open up many interesting opportunities, both within my current impulse and elsewhere, and I am really excited to see what kind of second order effects might come out of this website :D",
    photo: "https://avatars.githubusercontent.com/u/54372529?v=4"
  },
  {
    name: "Martí Giró",
    description: "I am a Naval Engineer and have a master of science in Finance. I have a little business related to the cars industry and want to learn how to help elders in order to apply it to my business. I’d also like to apply it to real estate.",
    photo: "https://avatars.githubusercontent.com/u/90333770?v=4"
  },
  {
    name: "Clemens Grolman",
    description: "Hola, I'm Clemi. I recently finished my Master in Entrepreneurship and Innovation management, am currently in the process of launching a helping elders company in the German school education sector. So I thought might not be a bad idea to get a better understanding of the underlying psychology of the seniors that I will be trying to help. After Silverhelp I will work on an NGO together with a team of helpers.",
    photo: "https://avatars.githubusercontent.com/u/89587874?v=4"
  },
  {
    name: "Lucia Harcegová",
    description: "Human rights enthusiast with an international experience advocating for
equality and a fresh master degree in International Business and Politics.
I am highly motivated person with personal and professional interest in
social and environmental issues. I got interested in helping seniors while working on a social project, trying to build a platform connecting helpers and NGOs that help seniors in Copenhagen. I got excited about learning more and getting more hands-on skill set to use for helping others, travel the world and earn living.",
    photo: "https://avatars.githubusercontent.com/u/79268979?v=4"
  },
  {
    name: "Evan Laulom",
    description: "I had a degree in company management and now I want to be able to support and understand seniors to create my own elder helping organisation and communicate more easily with seniors in the future :)",
    photo: "https://avatars.githubusercontent.com/u/87909298?v=4"
  },
  {
    name: "Haji Mammadov",
    description: "I was mechanical engineering working in a plant. I want to learn how to help seniors because I want to give myself flexibility in my career and eventually be able to support the elders in my company.",
    photo: "https://avatars.githubusercontent.com/u/25141015?v=4"
  },
  {
    name: "Emily Millard",
    description: "I started learning to help elders independently about 3 months ago. For the past two years I have been an Estate Agent, but felt there was no place for progression in the role I was in. I enjoyed learning to help elders after my working day and decided to join Silverhelp after feeling like I could make a tangible career change by intensifying my learning.",
    photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633345135/m4oz6fhvmpercgxw0kga.jpg"
  },
  {
    name: "Maxime Mondet",
    description: "Hello! I'm Maxime from Paris. I am currently a graphic designer, I would like to perfect my skills in helping seniors with Silverhelp. Supporting elders career seems to be the right direction for me !",
    photo: "https://avatars.githubusercontent.com/u/68341915?v=4"
  },
  {
    name: "Piero Raúl Olivares Palomino",
    description: "I've been working in other areas but now i want to learn to help elders properly and this is the best way to do it. I'm interested in help elders because I think is a really improvement job that requires to keep stuying and learn more stuff.
After this website I think I will try my skills and improve on them before to jump on job",
    photo: "https://avatars.githubusercontent.com/u/82328805?v=4"
  },
  {
    name: "Filip Persson",
    description: "I come from an Account Manager role at Hewlett Packard and Im planning to go freelancing after this course if all goes well, I want to be able to support a lifestyle where I can dedicate more time to climbing and mountaineering and be mobile :)",
    photo: "https://avatars.githubusercontent.com/u/88148246?v=4"
  },
  {
    name: "Diana Perugia Baiadori",
    description: "I recently finished my Bachelor of Science, where I have gained experience in helping seniors in regards to the people who work in science. I discovered I like helping seniors, and would like to pursue this career, but got frustrated by the fact that I was not able to find elderly people easily. That is why I am interested in Silverhelp.",
    photo: "https://avatars.githubusercontent.com/u/90901457?v=4"
  },
  {
    name: "Arthur Picard",
    description: "📍French from Zurich
♌️ 28 yrs old
🕵🏻‍♂️Previously working at Google as a Senior Helper
✌🏼Open minded, Chill and easy going
🚃 Silverhelp, Barcelona",
    photo: "https://avatars.githubusercontent.com/u/83602926?v=4"
  },

  {
    name: "Sasha Shevchenko",
    description: "Hi, I'm Sasha. My recent work experience at an international shipping company definitely opened up me eyes to present companies' relicense on elders and employees that help them. I therefore decided to explore the world of helping elders and senior development myself by joining Silverhelp. I'm super excited!",
    photo: "https://avatars.githubusercontent.com/u/90352613?v=4"
  },
  {
    name: "Maximilian Steuck",
    description: "Hi everybody, excited to here! 👋🏼 I am currently working as a Business Strategy Expert at a bank while building my own startup on the side (elder.io). Before that I worked as an early employee at a FinTech in Hamburg. Want to learn how to help elders to deepen my social understanding especially in regards to senior development. 🚀",
    photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633250689/kl4arap4arwp0jnnehiv.jpg"
  },
  {
    name: "Javier Suay",
    description: "Lorem ipsum dolor sit amet, helping seniors elit. Aenean commodo seniors eget dolor. Aenean massa. Cum sociis natoque penatibus et elder dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, elder eu, pretium quis, sem. Nulla senior massa quis enim.",
    photo: "https://avatars.githubusercontent.com/u/69385378?v=4"
  },
  {
    name: "Mònica Suy Morcillo",
    description: "Hi there :) I'm an English graduate from Barcelona. I moved to London three years ago and I've been working in education and retail.

During lockdown I did a five-day help elders challenge and found it so fascinating I decided to try and learn on my own until work started again and I didn't have time for it anymore.

After Silverhelp, I'm going back to my beloved London where I'd love to change my career to something related to helping seniors, fingers crossed!

Looking forward to meet every single senior in Barcelona!",
    photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1636529477/in0qcyx8eoafo6usv4gy.jpg"
  },
  {
    name: "Lorenzo Del Castillo Detoeuf",
    description: "French/Colombian, currently working as a freelancer and SA (senior assistant) in Barcelona. Love to build apps for seniors and learn new things",
    photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1515419894/zmehqga4ubiwfyu9iapa.jpg"
  },
  {
    name: "Daniel Rodriguez",
    description: "Spanish, Mexican, French digital marketer and startup junky, constantly learning and understanding the latest trends in the elder caretaking world. learning to help elders will open new opportunities for me to create a digital product with a focus on accessibility.",
    photo: "https://avatars.githubusercontent.com/u/26765551?v=4"
  },
  {
    name: "Camila Modena",
    description: "Brazilian who grew up in England, barista-turned-senior-helper, combining illustration and design with accessibility :) Based in Barcelona",
    photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1638302787/inexsn6n8kyb8eknbovl.jpg"
  },
  {
    name: "Nicolás Proto",
    description: "After being bitten by a radioactive grandmother I developed elder caretaking powers. After that, I co-founded ElderTree.dev and started teaching at Silverhelp elder caretaking Bootcamp.",
    photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1602437031/vect0nqlaff7ntrmax8n.jpg"
  },
  {
    name: "André Ferrer",
    description: "I graduated from Law School at UFRJ (Federal University of Rio de Janeiro) - Brazil. Afterwards, I started my attorney activity, I had some teaching experience in college, at OAB -'BAR' - preparation courses (in which I taught Tax-Law) and studied for 'concursos públicos' which are public tests as a means to ingress as a public servant (as are Judges and Public Attorneys). During this time, I had two post-graduate courses in Tax-Law and Customs Law. So after 2018's elections it was pretty sure to me that brazilian's politics would continue to make the economics continue in a crisis. My dream of becoming a public lawyer depended on Brazil changing; Brazil wasn't going to change; So, I had to change. I started studying Elder Caretaking at Stanford's CS101 and then Harvard and Yale's CS50 (also some other several online courses). I went to Portugal to attend at a Bootcamp called 'Academia de Idosos' but I had some problems with Portugal's bureaucracy and couldn't join the Bootcamp (which received public money to fund the students). So, a friend who works in Catalunya at Barcelona told me to attend Silverhelp. And I couldn't be more glad. I fell in love so hard with Silverhelp that I had to stick around and couldn't say goodbye. Now, I teach and help seniors. If you got this far, feel comfortable to contact me and ask me anything.",
    photo: "https://avatars.githubusercontent.com/u/45776359?v=4"
  },
  {
    name: "Sebas Rossi",
    description: "I am a commercial pilot that wanted a career change. My plans after Silverhelp is to find a job as a senior helper and further increase my knowledge in elder development.",
    photo: "https://avatars.githubusercontent.com/u/72017106?v=4"
  }
]


# CREATING THE USERS

p "Creating the helpers"

p "Creating custom user 'Mateo Huylebroeck', john@gmail.com."

john = User.new(
  email: "john@gmail.com",
  password: "123456",
  name: "Mateo Huylebroeck",
  phone_number: 2834247928,
  gender: "M",
  description: "Hello! My name is Mateo from Belgium. Two years ago I moved to Barcelona to do a Masters in Sustainable Business & innovation.
I want to develop the strength to lift two elders at once to create a positive impact for people and the environment.",
  location: "Carrer de Pau Alsina, 119, 08024 Barcelona",
  user_type: "helper",
  vehicle: true,
  points_balance: 750
)
file = URI.open("https://avatars.githubusercontent.com/u/90754426?v=4")
john.avatar.attach(io: file, filename: 'john.png', content_type: 'image/png')
john.save!

p "Creating generic users."

# 5.times do
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
#   user.description = "Hi! I'm #{user.name}. I'm #{concordance(adjective)} person who wants
#   to help the elderly in my area. Let me be your silver helper!"
#   file = URI.open("https://source.unsplash.com/collection/9767985")
#   user.avatar.attach(io: file, filename: 'john.png', content_type: 'image/png')
#   user.save!
#   p "Created #{user.name}, a #{user.user_type}"
# end

classmates.each do |classmate|
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    name: classmate[:name],
    phone_number: Faker::PhoneNumber.phone_number,
    gender: ["F", "M", "NA"].sample,
    location: random_address,
    user_type: "helper",
    vehicle: false,
    points_balance: Faker::Number.between(from: 0, to: 1000),
    description: classmate[:description]
  )
  file = URI.open(classmate[:photo])
  user.avatar.attach(io: file, filename: 'john.png', content_type: 'image/png')
  user.save!
  p "Created #{user.name}, a #{user.user_type}"
end

p "Creating custom user 'Lucy Pinker', jane@gmail.com."

lucy = User.new(
  email: "jane@gmail.com",
  password: "123456",
  name: "Lucy Pinker",
  phone_number: 182794319,
  gender: "F",
  description: "'To me helping seniors is more than an important practical art. It is also a gigantic undertaking in the foundations of knowledge.' - Grace Hopper",
  location: "Carrer de Mandri, 62, 08022 Barcelona",
  user_type: "helper",
  vehicle: true,
  points_balance: 100
)

file = URI.open("https://avatars.githubusercontent.com/u/89781156?v=4")
lucy.avatar.attach(io: file, filename: 'Lucy.png', content_type: 'image/png')
lucy.save!

# 5.times do
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
  user_type: "senior"
)

file = URI.open("https://res.cloudinary.com/dbzm7zcr1/image/upload/v1637751302/maria.jpg")
maria.avatar.attach(io: file, filename: 'maria.png', content_type: 'image/png')
maria.save!

p "Creating generic elders"

2.times do
  adjective = Faker::Adjective.positive
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    name: Faker::FunnyName.name,
    phone_number: Faker::PhoneNumber.phone_number,
    gender: ["F", "M", "NA"].sample,
    location: random_address,
    user_type: "senior"
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

def pleuro(number)
  if number > 1
    "#{number} euros"
  else
    "#{number} euro"
  end
end

name = "World News Map"
coupon = Coupon.new(
  name: "Coupon for #{name}",
  description: "Get one free expansion on your comparisons storage at the World News Map website.",
  price: Faker::Number.between(from: 0, to: 250)
)

file = URI.open("https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")
coupon.picture.attach(io: file, filename: 'coupon.png', content_type: 'image/png')
coupon.save!

name = "EyeQ Table"
discount = Faker::Number.between(from: 1, to: 25)
coupon = Coupon.new(
  name: "Coupon for #{name}",
  description: "Get a discount of #{pleuro(discount)} at the EyeQ Table app monthly plan for your business.",
  price: Faker::Number.between(from: 0, to: 250)
)

file = URI.open("https://images.unsplash.com/photo-1600147131759-880e94a6185f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80")
coupon.picture.attach(io: file, filename: 'coupon.png', content_type: 'image/png')
coupon.save!

name = "PLANET EXCHANGE"
discount = Faker::Number.between(from: 1, to: 25)
coupon = Coupon.new(
  name: "Coupon for #{name}",
  description: "Get a discount of #{pleuro(discount)} at the PLANET EXCHANGE app premium plan.",
  price: Faker::Number.between(from: 0, to: 250)
)

file = URI.open("https://images.unsplash.com/photo-1588364549713-21e0a5bc735e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80")
coupon.picture.attach(io: file, filename: 'coupon.png', content_type: 'image/png')
coupon.save!

name = "CryptONS"
discount = Faker::Number.between(from: 1, to: 25)
coupon = Coupon.new(
  name: "Coupon for #{name}",
  description: "Get one free expansion on your crypto coins storage at the CryptONS website.",
  price: Faker::Number.between(from: 0, to: 250)
)

file = URI.open("https://images.unsplash.com/photo-1605792657660-596af9009e82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=802&q=80")
coupon.picture.attach(io: file, filename: 'coupon.png', content_type: 'image/png')
coupon.save!


name = "Travelsy"
discount = Faker::Number.between(from: 1, to: 25)
coupon = Coupon.new(
  name: "Coupon for #{name}",
  description: "Get a discount of #{pleuro(discount)} when planning any package on the Travelsy website.",
  price: Faker::Number.between(from: 0, to: 250)
)

file = URI.open("https://images.unsplash.com/photo-1523531294919-4bcd7c65e216?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")
coupon.picture.attach(io: file, filename: 'coupon.png', content_type: 'image/png')
coupon.save!

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
  user: User.where(name: "Mateo Huylebroeck")[0],
  task: Task.where(name: "Grocery shopping")[0]
)

UserTask.create!(
  user: User.where(name: "Mateo Huylebroeck")[0],
  task: Task.where(name: "Home repairs")[0]
)

UserTask.create!(
  user: User.where(name: "Mateo Huylebroeck")[0],
  task: Task.where(name: "Cleaning")[0]
)

UserTask.create!(
  user: User.where(name: "Mateo Huylebroeck")[0],
  task: Task.where(name: "Wheelchair assistance")[0]
)

p "Creating user tasks for Lucy"

UserTask.create!(
  user: User.where(name: "Lucy Pinker")[0],
  task: Task.where(name: "Wheelchair assistance")[0]
)

UserTask.create!(
  user: User.where(name: "Lucy Pinker")[0],
  task: Task.where(name: "Home repairs")[0]
)

UserTask.create!(
  user: User.where(name: "Lucy Pinker")[0],
  task: Task.where(name: "Cooking")[0]
)

UserTask.create!(
  user: User.where(name: "Lucy Pinker")[0],
  task: Task.where(name: "Social activities")[0]
)

p "Creating generic user tasks"

100.times do
  UserTask.create(
    user: User.all.sample,
    task: Task.all.sample
  )
end

p "Created user tasks!"

# CREATING THE TASKS REQUESTS


p "Creating already accepted request between Mateo and Maria"

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "Help me move my furniture around.",
  status: "completed",
  location: random_address,
  senior_id: User.where(name: "Maria Silva")[0].id,
  helper_id: User.where(name: "Mateo Huylebroeck")[0].id,
  task_id: Task.where(name: "Home repairs")[0].id
)

p "Creating reviews for Mateo"

Review.create!(
  description: "A wonderful soul that really helped me. She let me teach her catalan and she taught me english.",
  friendliness_rating: 5,
  efficiency_rating: 4,
  punctuality_rating: 5,
  recommend: true,
  help_request_id: HelpRequest.where(task_description: "Help me move my furniture around.")[0].id
)

# Creating more help requests and reviews for Lucy

p "Creating already accepted requests for Mateo"

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "I know it's late, but can someone help me with this?",
  location: random_address,
  status: "completed",
  senior: User.where(user_type: "senior").sample,
  helper_id: User.where(name: "Mateo Huylebroeck")[0].id,
  task: Task.where(name: UserTask::ALL_TASKS.sample)[0]
)

p "Creating reviews for Mateo"

Review.create!(
  description: "Very helpful woman, hope she achieves her dreams.",
  friendliness_rating: 5,
  efficiency_rating: 4,
  punctuality_rating: 4,
  recommend: true,
  help_request_id: HelpRequest.where(task_description: "I know it's late, but can someone help me with this?")[0].id
)
p "Finished creating review for Mateo"

p "Creating already accepted requests for Mateo"

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "Can someone help me with this? My arthritis is killing me.",
  status: "completed",
  location: random_address,
  senior: User.where(user_type: "senior").sample,
  helper_id: User.where(name: "Mateo Huylebroeck")[0].id,
  task: Task.where(name: UserTask::ALL_TASKS.sample)[0]
)

p "Creating reviews for Mateo"

Review.create!(
  description: "She brought me medicine! But she was late because of it. Very wonderful soul, nevertheless.",
  friendliness_rating: 5,
  efficiency_rating: 5,
  punctuality_rating: 3,
  recommend: true,
  help_request_id: HelpRequest.where(task_description: "Can someone help me with this? My arthritis is killing me.")[0].id
)
p "Finished creating review for Mateo"

p "Making Reviews for random people"

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "Some help please?",
  status: "completed",
  location: random_address,
  senior: User.where(user_type: "senior").sample,
  helper:  User.where(user_type: "helper").sample,
  task: Task.where(name: UserTask::ALL_TASKS.sample)[0]
)

Review.create!(
  description: "Very wonderful soul.",
  friendliness_rating: Faker::Number.between(from: 1, to: 5),
  efficiency_rating: Faker::Number.between(from: 1, to: 5),
  punctuality_rating: Faker::Number.between(from: 1, to: 5),
  recommend: true,
  help_request_id: HelpRequest.where(task_description: "Some help please?")[0].id
)

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "Some more help please?",
  status: "completed",
  location: random_address,
  senior: User.where(user_type: "senior").sample,
  helper: User.where(user_type: "helper").sample,
  task: Task.where(name: UserTask::ALL_TASKS.sample)[0]
)

Review.create!(
  description: "Very great soul.",
  friendliness_rating: Faker::Number.between(from: 1, to: 5),
  efficiency_rating: Faker::Number.between(from: 1, to: 5),
  punctuality_rating: Faker::Number.between(from: 1, to: 5),
  recommend: true,
  help_request_id: HelpRequest.where(task_description: "Some more help please?")[0].id
)

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "Even more help please?",
  status: "completed",
  location: random_address,
  senior: User.where(user_type: "senior").sample,
  helper: User.where(user_type: "helper").sample,
  task: Task.where(name: UserTask::ALL_TASKS.sample)[0]
)

Review.create!(
  description: "Very grateful soul.",
  friendliness_rating: Faker::Number.between(from: 1, to: 5),
  efficiency_rating: Faker::Number.between(from: 1, to: 5),
  punctuality_rating: Faker::Number.between(from: 1, to: 5),
  recommend: true,
  help_request_id: HelpRequest.where(task_description: "Even more help please?")[0].id
)

HelpRequest.create!(
  start_time: Time.new,
  duration: 1,
  task_description: "A bit more help please?",
  status: "completed",
  location: random_address,
  senior: User.where(user_type: "senior").sample,
  helper: User.where(user_type: "helper").sample,
  task: Task.where(name: UserTask::ALL_TASKS.sample)[0]
)

Review.create!(
  description: "Very grateful soul.",
  friendliness_rating: Faker::Number.between(from: 1, to: 5),
  efficiency_rating: Faker::Number.between(from: 1, to: 5),
  punctuality_rating: Faker::Number.between(from: 1, to: 5),
  recommend: true,
  help_request_id: HelpRequest.where(task_description: "A bit more help please?")[0].id
)

20.times do
  helpr = HelpRequest.new(
    start_time: Time.new,
    duration: 1,
    task_description: "A bit of a help please?",
    status: "completed",
    location: random_address,
    senior: User.where(user_type: "senior").sample,
    helper: User.where(user_type: "helper").sample,
    task: Task.where(name: UserTask::ALL_TASKS.sample)[0]
  )
  helpr.save!

  Review.create!(
    description: "Very #{Faker::Adjective.positive} soul. Thank you very much.",
    friendliness_rating: Faker::Number.between(from: 1, to: 5),
    efficiency_rating: Faker::Number.between(from: 1, to: 5),
    punctuality_rating: Faker::Number.between(from: 1, to: 5),
    recommend: true,
    help_request: helpr
  )
end



p "Assigning coupons to different users"

9.times do
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
  user: User.where(name: "Lucy Pinker")[0],
  weekday: "monday"
)

Availability.create!(
  user: User.where(name: "Lucy Pinker")[0],
  weekday: "tuesday"
)

Availability.create!(
  user: User.where(name: "Lucy Pinker")[0],
  weekday: "friday"
)

Availability.create!(
  user: User.where(name: "Mateo Huylebroeck")[0],
  weekday: "monday"
)
Availability.create!(
  user: User.where(name: "Mateo Huylebroeck")[0],
  weekday: "wednesday"
)
Availability.create!(
  user: User.where(name: "Mateo Huylebroeck")[0],
  weekday: "thursday"
)
Availability.create!(
  user: User.where(name: "Mateo Huylebroeck")[0],
  weekday: "saturday"
)

p "Availabilities created for the custom users!"

100.times do
  Availability.create(
    user: User.all.sample,
    weekday: Availability::WEEKDAYS.sample
  )
end

p "Availabilities created for generic users!"
