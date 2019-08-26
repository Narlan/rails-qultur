class AddProgressToHunts < ActiveRecord::Migration[5.2]
  def change
    remove_column :hunts, :progress
    add_column :hunts, :progress, :integer, default: 0
  end
end

