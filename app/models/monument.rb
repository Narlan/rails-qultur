class Monument < ApplicationRecord
  has_many :questions
  has_many :hunts

  validates :name, :description, :photo, :address, presence: true
end
