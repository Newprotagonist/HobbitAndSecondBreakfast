require "faker"

Offer.destroy_all
User.destroy_all

hobbits = [
  {
    first_name: "Frodo",
    last_name: "Baggins"
  },
  {
    first_name: "Samwise",
    last_name: "Gamgee"
  },
  {
    first_name: "Meriadoc",
    last_name: "Brandybuck"
  },
  {
    first_name: "Peregrin",
    last_name: "Took"
  }
]

hobbits.each do |hobbit|
  user = User.new(
    first_name: hobbit[:first_name],
    last_name: hobbit[:first_name],
    password: "secret"
  )
  user.email = Faker::Internet.email(name: user.first_name, domain: user.last_name)
  user.save
end

User.all.each do |hobbit|
  summary = ""
  10.times do
    summary << "#{Faker::Fantasy::Tolkien.poem}\n"
  end
  Offer.create(
    localisation: Faker::Movies::LordOfTheRings.location,
    price: rand(20..100),
    summary: summary,
    user: hobbit
  )
end
