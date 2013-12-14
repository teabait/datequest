class RenameChallengesLevel < ActiveRecord::Migration
  def change
    rename_column :challenges, :level, :rank
  end
end
