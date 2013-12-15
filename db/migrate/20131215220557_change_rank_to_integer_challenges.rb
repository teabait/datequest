class ChangeRankToIntegerChallenges < ActiveRecord::Migration
  def change
    remove_column :challenges, :rank
    add_column :challenges, :rank, :integer, :default => 0, :null => false
  end
end
