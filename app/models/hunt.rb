class Hunt < ApplicationRecord
  belongs_to :monument
  belongs_to :user
  has_many :answers, through: :choices
  has_many :choices
  validates :user, :monument, presence: true
end
