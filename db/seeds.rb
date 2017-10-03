Poem.destroy_all

10.times do
  body = ""
  10.times do
    body += Faker::HarryPotter.quote + "<br>"
  end
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "ham")
  Poem.create(title: Faker::Book.title, body: body, user: user)
end
