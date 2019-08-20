class Monument < ApplicationRecord
  has_many :questions
  has_many :hunts

  validates :name, :description, :photo, :address, presence: true

  # geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CITY = ["Bordeaux", "Paris", "Lille", "Lyon", "Marseille", "Toulouse", "Dijon",
          "Strasbourg", "Brest", "Montpellier"].sort
end
