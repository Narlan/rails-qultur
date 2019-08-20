class Monument < ApplicationRecord
  has_many :questions
  has_many :hunts

  validates :name, :description, :photo, :address, presence: true

  CITY = ["Bordeaux", "Paris", "Lille", "Lyon", "Marseille", "Toulouse", "Dijon",
          "Strasbourg", "Brest", "Montpellier"].sort
end


<%= f.input :address, collection: Monument::CITY %>
