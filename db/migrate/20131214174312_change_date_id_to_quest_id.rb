class ChangeDateIdToQuestId < ActiveRecord::Migration
  def change
    rename_column :challenges_quests, :date_id, :quest_id
  end
end
