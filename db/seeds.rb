Poem.destroy_all

10.times do
  body = ""
  10.times do
    body += Faker::HarryPotter.quote + "\n"
  end
  Poem.create(title: Faker::Book.title, body: body)
end
