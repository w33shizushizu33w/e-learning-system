User.create!(name: "SHIZUE",
    email: "email@email.com",
    password: "123abc456def",
    password_confirmation: "123abc456def",
    is_admin = 1)
    is_admin = is_admin

50.times do |n|
    name = Faker::Name.name
    email = "username#{n+1}@email.org"
    password = "123abc456def"
    is_admin = 0
    User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)

end   
