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

30.times do |n|
    title = Faker::Food.fruits
    description = Faker::Food.description
    Category.create!(title: title, 
                     description: description)
  end

  cats = Category.order(:created_at).take(3)

 5.times do
    word = Faker::Esport.team
    choice1 = Faker::Esport.player
    choice2 = Faker::Esport.player
    choice3 = Faker::Esport.player
    cats.each { |wrd| wrd.words.create!(
        content: word,
        :choices_attributes => 
        {
            0 =>{
                content: choice1,
                correct: true
            },
  
            1 =>{
                content: choice2,
                correct: false
            },
               2 =>{
                content: choice3,
                correct: false
            }
        }
          
        ) }
      
  end

