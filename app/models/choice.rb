class Choice < ApplicationRecord
  belongs_to :hunt
  belongs_to :proposal

  belongs_to :question
end
