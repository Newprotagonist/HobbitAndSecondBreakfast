require "faker"

# Reservation.destroy_all
# Offer.destroy_all
# User.destroy_all
`rails db:drop db:create db:migrate`

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
  user = User.new(hobbit)
  user.password = "secret"
  user.email = "#{user.first_name.chr}#{user.last_name}@hobbits.com"
  user.hobbit = true
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

gandalf = User.create(
  first_name: "Gandalf",
  last_name: "The White",
  email: "gandalf@istari.org",
  password: "secret",
  hobbit: false
)

Offer.all.each do |offer|
  Reservation.create(
    offer: offer,
    user: gandalf,
    start_date: Date.today,
    end_date: Date.today + 20,
    total_price: offer.price * 20
  )
end

User.create(
  first_name: "Saruman",
  last_name: "The Betrayer",
  email: "saruman@istari.org",
  password: "secret",
  hobbit: false
)
