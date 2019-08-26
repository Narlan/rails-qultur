class AddExpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :exp, :integer, default: 0
  end
end
