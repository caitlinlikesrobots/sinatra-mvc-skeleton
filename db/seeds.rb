# user seeds
10.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

Category.create(name: "mac'n'cheese")
Category.create(name: "Macarthur")
Category.create(name: "Old Macdonald")
Category.create(name: "Return of the Mack")
Category.create(name: "Macintosh")
Category.create(name: "Mack the Knife")
Category.create(name: "Mack from It's Always Sunny in Philadelphia")
Category.create(name: "MAC Makeup")
Category.create(name: "Mack Trucks")
Category.create(name: "Big Mac")

