class Monument < ApplicationRecord
  has_many :questions
  has_many :hunts
end
