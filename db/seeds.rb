admin = Role.create(name: "admin")
client = Role.create(name: "client")
visitor = Role.create(name: "visitor")

User.create(email: "cfo.oostdijk@gmail.com", password: "12345", role: admin)

5.times do
  user = User.create(email: Faker::Internet.email, password: "client", role: client)
  category = Category.create(name: Faker::Book.genre)
  Post.create(title: Faker::Book.title, content: Faker::Lorem.paragraph, category: category, date: Faker::Date.in_date_period, user: user)
end

p "#{User.count} users created"
p "#{Category.count} categories created"
p "#{Role.count} roles created"
p "#{Post.count} posts created"