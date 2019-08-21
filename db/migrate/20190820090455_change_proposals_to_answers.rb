class ChangeProposalsToAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :content, :question_id

    rename_table :answers, :choices
    rename_table :proposals, :answers

    add_column :answers, :content, :string, array: true
    add_reference :answers, :question, foreign_key: true
  end
end
