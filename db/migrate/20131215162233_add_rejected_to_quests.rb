class AddRejectedToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :rejected, :boolean, default: false
  end
end
