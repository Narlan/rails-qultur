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
eiffel = Monument.create!(name: "Eiffel Tower",
                      description: "La tour Eiffel est une tour de fer puddlé de 324 mètres de hauteur (avec antennes) située à Paris, à l’extrémité nord-ouest du parc du Champ-de-Mars en bordure de la Seine dans le 7e arrondissement.",
                      photo:"https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Tour_eiffel_de_nuit.jpg/1024px-Tour_eiffel_de_nuit.jpg",
                      address: "Avenue Gustave Eiffel, 75007 Paris")
puts "#{eiffel.name} has been created!"

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
