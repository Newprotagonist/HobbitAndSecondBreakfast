hobbits = {
  frodo: {
    first_name: "Frodo",
    last_name: "Baggins"
  },
  sam: {
    first_name: "Samwise",
    last_name: "Gamgee"
  },
  merry: {
    first_name: "Meriadoc",
    last_name: "Brandybuck"
  },
  pippin: {
    first_name: "Peregrin",
    last_name: "Took"
  }
}

hobbits.each do |_k, v|
  User.new(
    first_name: v[:first_name],
    last_name: v[:first_name],
    email: Faker::Internet.email,
    password: "secret",
    role: "Hobbit"
  )
end

User.all.each do |hobbit|
  summary = ""
  10.times do
    summary << "#{Faker::Fantasy::Tolkien.poem}\n"
  end
  Offer.new(
    localisation: Faker::Movies::LordOfTheRings.location,
    price: rand(20..100),
    summary: summary,
    user: hobbit
  )
end
