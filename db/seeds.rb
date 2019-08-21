# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating a user..."
user = User.create!(first_name: "John", last_name: "Doe", nickname: "Jedi", age: 30,
                    email: "user@example.com", password: "password",
                    photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ137OO1cEyky0WKe3HS3KZpkDjk1Ex06k-CaX0K_TiCIre5XTiYg")
puts "#{user.first_name} has been created!"

puts "Creating 3 monuments..."
monument = Monument.create!(name: "Eiffel Tower",
                      description: "La tour Eiffel est une tour de fer puddlé de 324 mètres de hauteur (avec antennes) située à Paris, à l’extrémité nord-ouest du parc du Champ-de-Mars en bordure de la Seine dans le 7e arrondissement.",
                      photo:"https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Tour_eiffel_de_nuit.jpg/1024px-Tour_eiffel_de_nuit.jpg",
                      address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris")
puts "#{monument.name} has been created!"

monument = Monument.create!(name: "Cathédrale Notre-Dame de Paris",
                      description: "DescriptionLa cathédrale Notre-Dame de Paris, communément appelée Notre-Dame, est la cathédrale de l'archidiocèse de Paris, située sur l'île de la Cité. Dédiée à la Vierge Marie, elle est pendant de nombreux siècles l'une des cathédrales les plus grandes d'Occident. ",
                      photo:"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Notre_Dame_de_Paris_2013-07-24.jpg/280px-Notre_Dame_de_Paris_2013-07-24.jpg",
                      address: "63 Rue de la Santé, 75013 Paris")
puts "#{monument.name} has been created!"

monument = Monument.create!(name: "Arc de Triomphe",
                      description: "L’arc de triomphe de l’Étoile, souvent appelé simplement l’Arc de triomphe, dont la construction, décidée par l'empereur Napoléon Iᵉʳ, débuta en 1806 et s'acheva en 1836 sous Louis-Philippe, est situé à Paris, dans les 8ᵉ, 16ᵉ, et 17ᵉ arrondissements.",
                      photo:"https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Arc_de_Triomphe%2C_Paris_21_October_2010.jpg/1024px-Arc_de_Triomphe%2C_Paris_21_October_2010.jpg",
                      address: "Place Charles de Gaulle, 75008 Paris")
puts "#{monument.name} has been created!"

system "clear"

puts "email: user@example.com"
puts "password: password"


puts " ▄▄▄▄▄▄▄  ▄  ▄▄  ▄ ▄▄  ▄▄▄ ▄▄▄▄▄▄▄
 █ ▄▄▄ █ ▄▄█▀█▄█▀█ ██▀▀▄▀  █ ▄▄▄ █
 █ ███ █  ▀█▀ ▀█▀  ▄▄  █▄▄ █ ███ █
 █▄▄▄▄▄█ ▄▀▄ ▄▀▄ ▄▀▄▀▄▀▄▀█ █▄▄▄▄▄█
 ▄▄▄ ▄▄▄▄█▀█▄▀▀█▄▀█ ▀▄█▀██▄▄   ▄
 ▄▄ ▄▀ ▄▀▀▄▀▀ ▄▀▀ ▀▀ ▄   ▀▄█ ▄▄▀██
 ▀ ▀▀▀█▄▀█  ▀▄  ▀▄█   ██▀▄▄▄▄    █
 ▄██  ▄▄▀█▀ ██▀▄██ ▄ ▀▀▄ █ ▄ ▄▄███
  ██▀█ ▄▀ █ ▄▀▀█▄██ ▀██ ▀█▀█ ▀  █
 ▄▀▄ █ ▄ ▀█▀▀ ▄▀▀ ▀  █▀▀ ▀▀█▄▄▄▄██
 ▀▀▀█  ▄▄▀ █▀▄  ▀▄██▀▀█ ▀▄ ▄▄ ▀ ▄▄
 ▄ ▀  █▄▀▄▀ ██▀▄ ▄▀▄ ▀ ▄▀█▀█▄▄▀▄██
 ▄▀▀▄▀▀▄█▄ ▀▄▀▀█▀██   █ ▀▄█▄█▄  ▄█
 ▄▄▄▄▄▄▄ ██ ▀ ▄▀ ██▀ ▀▀ ██ ▄ █▄▀▄▄
 █ ▄▄▄ █ █▀ ▀▄  ███▀▀▄██▀█▄▄▄█  ▄█
 █ ███ █ ▄▀▀██▀▄ █▄  ▀▀▄█  ▄▄▄ ▀ █
 █▄▄▄▄▄█ █▄▀▄▀▀█  █▀███ ▀███▀▄▀ █▄"
