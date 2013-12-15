class ChangeDateTimeToQuestDateAndQuestTime < ActiveRecord::Migration
  def change
    remove_column :quests, :date_time
    add_column :quests, :quest_date, :date
    add_column :quests, :quest_time, :time
  end
end
