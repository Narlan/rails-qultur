class CreateHunts < ActiveRecord::Migration[5.2]
  def change
    create_table :hunts do |t|
      t.boolean :current_hunt, default: false
      t.integer :score, default: 0
      t.string :progress, default: "pending"
      t.references :monument, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
