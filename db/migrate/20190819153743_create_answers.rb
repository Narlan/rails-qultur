class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :hunt, foreign_key: true
      t.references :proposal, foreign_key: true
      t.string :content
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
