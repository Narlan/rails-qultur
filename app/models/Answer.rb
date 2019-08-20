class Answer < ApplicationRecord
  has_many :choices
  belongs_to :question

  validates :success, :question, :content, presence: true
end
