User.all.each do |hobbit|
  Offer.create!(
    location: "The Shire",
    price: rand(20..100),
    summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
