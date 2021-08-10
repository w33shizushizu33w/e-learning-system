User.create!(name: "SHIZUE",
    email: "email@email.com",
    password: "123abc456def",
    password_confirmation: "123abc456def",
    is_admin: true)

50.times do |n|
    name = Faker::Name.name
    email = "username#{n+1}@email.org"
    password = "123abc456def"
    User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password,
                is_admin: false)

end   
