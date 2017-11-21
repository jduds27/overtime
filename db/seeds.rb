@user = User.create(email: "test@test.com",
                    password: "jason1",
                    password_confirmation: "jason1",
                    first_name: "Jon",
                    last_name: "Snow",
                    phone: "8014714923")

puts " 1 user created "

AdminUser.create(email: "admin@test.com",
                 password: "jason1",
                 password_confirmation: "jason1",
                 first_name: "Admin",
                 last_name: "Snow",
                 phone: "8014714923")

puts " 1 AdminUser created "

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"
