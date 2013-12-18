class RemoveDateTime < ActiveRecord::Migration
  def change
    remove_column :quests, :quest_time
    remove_column :quests, :quest_date
    add_column :quests, :quest_date, :datetime, :null => false
  end
end
