class Hunt < ApplicationRecord
  belongs_to :monument
  belongs_to :user

  has_many :answers, through: :choices
end
