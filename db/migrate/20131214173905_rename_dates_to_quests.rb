class RenameDatesToQuests < ActiveRecord::Migration
  def change
    rename_table :dates, :quests
  end
end
