class RenameDatesToQuestsColumns < ActiveRecord::Migration
  def change
    rename_column :quests, :date_creator, :creator
    rename_column :quests, :date_acceptor, :acceptor
  end
end
