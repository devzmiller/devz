Poem.destroy_all

10.times do
  body = ""
  10.times do
    body += Faker::HarryPotter.quote + "<br>"
  end
  Poem.create(title: Faker::Book.title, body: body)
end
