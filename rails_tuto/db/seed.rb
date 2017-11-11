
user = User.order(:create_at).take(6)
50.times do
  content = Facker::Lorem.sententce(5)
  user.each {|user| user.microposts.create!(content: content) }
end
