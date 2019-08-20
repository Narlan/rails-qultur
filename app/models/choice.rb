class Choice < ApplicationRecord
  belongs_to :hunt
  belongs_to :answer

  validates :hunt, :answer, presence: true
end
