monuments = {
  monument_001: {
    name: "Eiffel Tower",
    description: "La tour Eiffel est une tour de fer puddlé de 324 mètres de hauteur (avec antennes) située à Paris, à l’extrémité nord-ouest du parc du Champ-de-Mars en bordure de la Seine dans le 7e arrondissement.",
    photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ137OO1cEyky0WKe3HS3KZpkDjk1Ex06k-CaX0K_TiCIre5XTiYg",
    address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris"
  },
  monument_002: {
    name: "Cathédrale Notre-Dame de Paris",
    description: "DescriptionLa cathédrale Notre-Dame de Paris, communément appelée Notre-Dame, est la cathédrale de l'archidiocèse de Paris, située sur l'île de la Cité. Dédiée à la Vierge Marie, elle est pendant de nombreux siècles l'une des cathédrales les plus grandes d'Occident. ",
    photo:"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Notre_Dame_de_Paris_2013-07-24.jpg/280px-Notre_Dame_de_Paris_2013-07-24.jpg",
    address: "63 Rue de la Santé, 75013 Paris"
    },
    monument_003: {
      name: "Arc de Triomphe",
      description: "L’arc de triomphe de l’Étoile, souvent appelé simplement l’Arc de triomphe, dont la construction, décidée par l'empereur Napoléon Iᵉʳ, débuta en 1806 et s'acheva en 1836 sous Louis-Philippe, est situé à Paris, dans les 8ᵉ, 16ᵉ, et 17ᵉ arrondissements.",
      photo:"https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Arc_de_Triomphe\%2C_Paris_21_October_2010.jpg/1024px-Arc_de_Triomphe\%2C_Paris_21_October_2010.jpg",
      address: "Place Charles de Gaulle, 75008 Paris"
    }
}

def create_monuments(monuments)
  monuments.each do |key, value|
    Monument.create!(value)
    puts "created #{value[:name]}"
  end
end

print "Creating a user... "
user = User.create!(first_name: "John", last_name: "Doe", nickname: "Jedi", age: 30,
                    email: "user@example.com", password: "password",
                    photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ137OO1cEyky0WKe3HS3KZpkDjk1Ex06k-CaX0K_TiCIre5XTiYg")
puts "done!"

puts "Creating #{monuments.length} monument(s)..."
create_monuments(monuments)
puts "... done!"

system "clear"

puts "email: user@example.com"
puts "password: password"

puts "▄▄▄▄▄▄▄  ▄  ▄▄  ▄ ▄▄  ▄▄▄ ▄▄▄▄▄▄▄
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
