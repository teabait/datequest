class RenameChallengesDatesToChallengesQuests < ActiveRecord::Migration
  def change
    rename_table :challenges_dates, :challenges_quests
  end
end
