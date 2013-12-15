class ChangeRankToInteger < ActiveRecord::Migration
  def change
    remove_column :users, :rank
    add_column :users, :rank, :integer, :default => 0, :null => false
  end
end
