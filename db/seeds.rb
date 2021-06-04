10.times {Painting.create(title: Faker::Book.title, artist_name: Faker::Superhero.name, country: Faker::Address.country)}
10.times {User.create(name: Faker::Science.scientist, email: Faker::Internet.email, password: "password")}

Painting.all.each do |painting|
  User.all.each do |user|
    painting.comments.create(message: Faker::Quotes::Shakespeare.king_richard_iii_quote, user_id: user.id)
  end
end
