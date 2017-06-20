User.create!(name: "John Son", email: "frankvanphu@gmail.com", password: "123456", 
  password_confirmation: "123456", is_admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name, email: email, password: password, password_confirmation: password)
end

50.times do |n|
  title  = "Product-#{n+1}"
  description = "description about roduct-#{n+1}"
  image_url = "product_image-#{n+1}.jpg"
  price = "#{n+5000}"
  rating = "#{n+2}"
  Product.create!(title: title, description: description,image_url: image_url,
    price: price, rating: rating)
end

Category.create!(name: "Food")
Category.create!(name: "Drink")
