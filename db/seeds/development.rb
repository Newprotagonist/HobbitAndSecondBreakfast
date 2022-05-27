require "faker"

# create hobbit users and their respective offers
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

# create non-hobbit user
gandalf = User.create(
  first_name: "Gandalf",
  last_name: "The White",
  email: "gandalf@istari.org",
  password: "secret",
  hobbit: false
)

# create reservations
Offer.all.each do |offer|
  Reservation.create(
    title: "Quest to destroy the Ring",
    offer: offer,
    user: gandalf,
    start_date: Date.parse("29 July 1954"),
    end_date: Date.parse("20 October 1955"),
    total_price: offer.price * 20,
    status: "Done"
  )
end

# review all past reservations
Reservation.all.each do |reservation|
  hobbit = reservation.offer.user
  wizard = reservation.user
  Review.create!(
    giver: hobbit,
    receiver: wizard,
    reservation: reservation,
    content: "% 10s" % Faker::Fantasy::Tolkien.poem,
    rating: rand(0..5.0).round(1)
  )
  Review.create!(
    giver: wizard,
    receiver: hobbit,
    reservation: reservation,
    content: "% 10s" % Faker::Fantasy::Tolkien.poem,
    rating: rand(0..5.0).round(1)
  )
  reservation.update!(status: "Done")
end

# create non-reviewed but reviewable reservations

Offer.all.sample(3).each do |offer|
  reservation = Reservation.new(
    title: "Quest to eat the third breakfast",
    offer: offer,
    user: gandalf,
    start_date: Date.today - 7,
    end_date: Date.today - 2,
    total_price: offer.price * 5,
    status: "Accepted"
  )
  reservation.save(validate: false)
end

# create non-reviewed reservations
Offer.all.sample(3).each do |offer|
  Reservation.create(
    title: "Quest to eat the third breakfast",
    offer: offer,
    user: gandalf,
    start_date: Date.today - 1,
    end_date: Date.today + 9,
    total_price: offer.price * 10
  )
end

User.create(
  first_name: "Saruman",
  last_name: "The Betrayer",
  email: "saruman@istari.org",
  password: "secret",
  hobbit: false
)
