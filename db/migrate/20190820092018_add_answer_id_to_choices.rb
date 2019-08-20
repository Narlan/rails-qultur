class AddAnswerIdToChoices < ActiveRecord::Migration[5.2]
  def change
    add_reference :choices, :answer, foreign_key: true
  end
end
