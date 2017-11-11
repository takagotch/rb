User.create!(name:                  "takagotch",
             email:                 "takagotch@example.com",
			 password:              "foobar",
			 password_confirmation: "foobar",
			 admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:                  name,
               email:                 email,
			   password:              password,
			   password_confirmation: password)
end

user = User.order(:create_at).take(6)
50.times do
  content = Facker::Lorem.sententce(5)
  user.each {|user| user.microposts.create!(content: content) }
end
