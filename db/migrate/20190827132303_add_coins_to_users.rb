class AddCoinsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :coins, :integer, default: 0
  end
end
