Reservation.destroy_all
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
  user = User.new(hobbit)
  user.password = "secret"
  user.email = "#{user.first_name.chr}#{user.last_name}@hobbits.com"
  user.hobbit = true
  user.save
end
