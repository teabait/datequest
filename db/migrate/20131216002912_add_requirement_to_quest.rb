class AddRequirementToQuest < ActiveRecord::Migration
  def change
    change_column :quests, :quest_time, :time, null: false
    change_column :quests, :quest_date, :date, null: false
  end
end
