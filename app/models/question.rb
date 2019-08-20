class Question < ApplicationRecord
  has_many :answers
  belongs_to :monument

  validates :monument, :title, presence: true
end
