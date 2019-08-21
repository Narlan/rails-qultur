class Answer < ApplicationRecord
  has_many :choices
  belongs_to :question

  validates :question, :content, presence: true
end
