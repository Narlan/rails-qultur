class RemoveProposalFromChoices < ActiveRecord::Migration[5.2]
  def change
    remove_column :choices, :proposal_id
    remove_column :choices, :question_id
  end
end
