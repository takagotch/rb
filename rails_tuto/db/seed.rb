User.create!(name:                  "takagotch",
             email:                 "takagotch@example.com",
			 password:              "foobar",
			 password_confirmation: "foobar",
			 admin: true,
			 activated: true,
			 activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:                  name,
               email:                 email,
			   password:              password,
			   password_confirmation: password,
			   activated: true,
			   activated_at: Time.zone.now)
end

user = User.order(:create_at).take(6)
50.times do
  content = Facker::Lorem.sentence(5)
  user.each {|user| user.microposts.create!(content: content) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }