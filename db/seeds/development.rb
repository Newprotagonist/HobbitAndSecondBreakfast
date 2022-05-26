require "faker"

User.all.each do |hobbit|
  summary = ""
  10.times do
    summary << "#{Faker::Fantasy::Tolkien.poem}\n"
  end
  Offer.create!(
    location: Faker::Movies::LordOfTheRings.location,
    price: rand(75..120),
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
    title: "Quest to destroy the Ring",
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
