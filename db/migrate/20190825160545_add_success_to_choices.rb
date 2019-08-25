class AddSuccessToChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :choices, :success, :boolean
    remove_column :answers, :success
  end
end
