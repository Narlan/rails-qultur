class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.boolean :success, default: false

      t.timestamps
    end
  end
end
